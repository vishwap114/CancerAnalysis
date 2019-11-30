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

            using (OracleDataAdapter adapter = new OracleDataAdapter(Queries.NewCancerCasesQuerie, connection))
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

            using (OracleDataAdapter adapter = new OracleDataAdapter(Queries.CancerDeathsQuerie, connection))
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