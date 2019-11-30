namespace CancerAnalysis
{
    public class Queries
    {
        public static string NewCancerCasesQuerie = "SELECT SITE_NAME AS CancerType, SUM(PATIENT_ID) AS TotalCases " +
                "FROM pselugar.CASE C JOIN mvdoshi.SITE_MASTER S ON C.SITE = S.SITE_ID " +
                "WHERE C.YEAR_OF_DIAGNOSIS = 2016 " +
                "GROUP BY SITE_NAME ORDER BY TotalCases DESC";

        public static string CancerDeathsQuerie = "SELECT SITE_NAME AS CancerType, SUM(PATIENT_ID) AS TotalDeaths " +
                "FROM pselugar.CASE C JOIN mvdoshi.SITE_MASTER S ON C.SITE = S.SITE_ID " +
                "WHERE C.YEAR_OF_DIAGNOSIS = 2016 AND C.VITAL_STATUS = \'Dead\' " +
                "GROUP BY SITE_NAME ORDER BY TotalDeaths DESC";
    }
}