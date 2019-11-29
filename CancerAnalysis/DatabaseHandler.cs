using System.Collections.Generic;
using System.Data;
using CancerAnalysis.Model;
using Oracle.ManagedDataAccess.Client;

namespace CancerAnalysis
{
    public class DatabaseHandler
    {
        private OracleConnection connection;

        public DatabaseHandler()
        {
            OpenConnection();
        }

        private void OpenConnection()
        {
            if (IsConnectionAlive()) return;

            connection = new OracleConnection
            {
                ConnectionString = "User ID=vbpatel; Password=safeacc11; Data Source=oracle.cise.ufl.edu/orcl;"
            };
            connection.Open();
        }

        private bool IsConnectionAlive()
        {
            return connection != null && connection.State == ConnectionState.Open;
        }

        private void CloseConnection()
        {
            if (connection != null && connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public List<CancerCase> GetNewCancerCases()
        {
            if (!IsConnectionAlive()) OpenConnection();

            var result = new List<CancerCase>();

            string query = "SELECT SITE_NAME AS CancerType, SUM(PATIENT_ID) AS TotalCases " +
                "FROM pselugar.CASE C JOIN mvdoshi.SITE_MASTER S ON C.SITE = S.SITE_ID " +
                "WHERE C.YEAR_OF_DIAGNOSIS = 2016 " +
                "GROUP BY SITE_NAME ORDER BY TotalCases DESC";

            using (OracleDataAdapter adapter = new OracleDataAdapter(query, connection))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    CancerCase cancerCase = new CancerCase
                    {
                        CancerType = dr["CancerType"].ToString(),
                        TotalCases = long.Parse(dr["TotalCases"].ToString())
                    };

                    result.Add(cancerCase);
                }
            }

            long otherCount = 0;
            for (var i = 4; i < result.Count; i++)
            {
                otherCount += result[i].TotalCases;
            }

            result.RemoveRange(4, result.Count - 4);
            result.Add(new CancerCase { CancerType = "Other", TotalCases = otherCount });

            return result;
        }

        public List<CancerCase> GetCancerDeaths()
        {
            if (!IsConnectionAlive()) OpenConnection();

            var result = new List<CancerCase>();

            string query = "SELECT SITE_NAME AS CancerType, SUM(PATIENT_ID) AS TotalDeaths " +
                "FROM pselugar.CASE C JOIN mvdoshi.SITE_MASTER S ON C.SITE = S.SITE_ID " +
                "WHERE C.YEAR_OF_DIAGNOSIS = 2016 AND C.VITAL_STATUS = \'Dead\' " +
                "GROUP BY SITE_NAME ORDER BY TotalDeaths DESC";

            using (OracleDataAdapter adapter = new OracleDataAdapter(query, connection))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    CancerCase cancerCase = new CancerCase
                    {
                        CancerType = dr["CancerType"].ToString(),
                        TotalDeaths = long.Parse(dr["TotalDeaths"].ToString())
                    };

                    result.Add(cancerCase);
                }
            }

            long otherCount = 0;
            for (var i = 4; i < result.Count; i++)
            {
                otherCount += result[i].TotalDeaths;
            }

            result.RemoveRange(4, result.Count - 4);
            result.Add(new CancerCase { CancerType = "Other", TotalDeaths = otherCount });

            return result;
        }

        public void finish()
        {
            CloseConnection();
        }
    }
}