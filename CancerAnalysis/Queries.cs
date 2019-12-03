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

        //Display which cancer type occurs the most according to Race
        public static string query1 = "SELECT Race, MAX(Count_of_Patients)" +
                                      "FROM(" +
                                          "SELECT Site_name, P.race AS Race, COUNT(C.Patient_ID) AS Count_of_Patients" +
                                          "FROM MVDOSHI.site_master S" +
                                          "JOIN Pselugar.Case C ON C.Site = S.Site_ID" +
                                          "JOIN MVDOSHI.patient P ON P.Patient_ID = C.Patient_ID" +
                                          "GROUP BY P.Race, Site_name" +
                                          "ORDER BY P.Race" +
                                      ")" +
                                      "Group BY Race" +
                                      "ORDER By Race";

        //Count of patients for each race
        public static string patientByRace = "SELECT Race, COUNT(DISTINCT(Patient_ID)) AS NoOfPatients " +
                                        "FROM MVDOSHI.patient " +
                                        "GROUP BY Race " +
                                        "ORDER BY Race DESC " +
                                        "FETCH FIRST 10 ROWS ONLY";

        // Count of patients for each cancer type
        public static string query3 = "SELECT s.site_name, COUNT(c.Patient_ID) AS NoOfPatients" +
                                        "FROM MVDOSHI.Site_Master s" +
                                        "JOIN PSelugar.CASE c ON c.site = s.Site_ID" +
                                        "GROUP BY s.site_name" +
                                        "ORDER BY s.site_name";

        //Popular cancer type according to different age groups
        //-- Age Group: 0-20
        public static string query4 = "WITH PatientCount(maxPatient, CancerId) AS(" +
                                        "SELECT MAX(CountPID) AS MaxCountPID, Site from (" +
                                            "SELECT COUNT(p.patient_id) as CountPID, c.site as Site, p.age" +
                                            "FROM Mvdoshi.Patient p" +
                                            "JOIN Pselugar.Case c ON c.patient_id = p.patient_id" +
                                            "WHERE SUBSTR(p.age,0,2) >=0 and SUBSTR(p.age,0,2) <=20" +
                                            "GROUP BY c.site, p.age" +
                                           ")" +
                                        "GROUP BY site" +
                                        "ORDER BY MaxCountPID DESC" +
                                        "FETCH FIRST ROW ONLY)" +
                                    "SELECT s.site_name, p.maxPatient" +
                                    "FROM PatientCount p" +
                                    "JOIN mvdoshi.site_master s ON s.site_id = p.CancerId";

        //-- Age Group: 20-40
        public static string query5 = "WITH PatientCount(maxPatient, CancerId) AS (" +
                                        "SELECT MAX(CountPID) AS MaxCountPID, Site from (" +
                                            "SELECT COUNT(p.patient_id) as CountPID, c.site as Site, p.age" +
                                            "FROM Mvdoshi.Patient p" +
                                            "JOIN Pselugar.Case c ON c.patient_id = p.patient_id" +
                                            "WHERE SUBSTR(p.age,0,2) >20 and SUBSTR(p.age,0,2) <=40" +
                                            "GROUP BY c.site, p.age" +
                                            ")" +
                                        "GROUP BY site" +
                                        "ORDER BY MaxCountPID DESC" +
                                        "FETCH FIRST ROW ONLY)" +
                                    "SELECT s.site_name, p.maxPatient" +
                                    "FROM PatientCount p" +
                                    "JOIN mvdoshi.site_master s ON s.site_id = p.CancerId";

        //-- Age Group: 40-60
        public static string query6 = "WITH PatientCount(maxPatient, CancerId) AS (" +
                                       "SELECT MAX(CountPID) AS MaxCountPID, Site from (" +
                                           "SELECT COUNT(p.patient_id) as CountPID, c.site as Site, p.age" +
                                           "FROM Mvdoshi.Patient p" +
                                           "JOIN Pselugar.Case c ON c.patient_id = p.patient_id" +
                                           "WHERE SUBSTR(p.age,0,2) >40 and SUBSTR(p.age,0,2) <=60" +
                                           "GROUP BY c.site, p.age" +
                                           ")" +
                                       "GROUP BY site" +
                                       "ORDER BY MaxCountPID DESC" +
                                       "FETCH FIRST ROW ONLY)" +
                                   "SELECT s.site_name, p.maxPatient" +
                                   "FROM PatientCount p" +
                                   "JOIN mvdoshi.site_master s ON s.site_id = p.CancerId";


        //-- Age Group: 60 plus
        public static string query7 = "WITH PatientCount(maxPatient, CancerId) AS (" +
                                       "SELECT MAX(CountPID) AS MaxCountPID, Site from (" +
                                           "SELECT COUNT(p.patient_id) as CountPID, c.site as Site, p.age" +
                                           "FROM Mvdoshi.Patient p" +
                                           "JOIN Pselugar.Case c ON c.patient_id = p.patient_id" +
                                           "WHERE SUBSTR(p.age,0,2) >40 and SUBSTR(p.age,0,2) <=60" +
                                           "GROUP BY c.site, p.age" +
                                           ")" +
                                       "GROUP BY site" +
                                       "ORDER BY MaxCountPID DESC" +
                                       "FETCH FIRST ROW ONLY)" +
                                   "SELECT s.site_name, p.maxPatient" +
                                   "FROM PatientCount p" +
                                   "JOIN mvdoshi.site_master s ON s.site_id = p.CancerId";


        // Number of patients for a particular cancer type for different years of diagnosis

        public static string query8 = "SELECT COUNT(c.patient_id), s.site_name, Year_Of_Diagnosis" +
                                        "FROM PSelugar.Case c" +
                                        "JOIN MVDOSHI.Site_Master S ON S.Site_ID = c.Site" +
                                        "WHERE s.site_name = 'Transverse Colon' " +                  //change  s.site_name according to inpute cancer type
                                        "GROUP BY c.Year_Of_Diagnosis, s.site_name";

        // Display the most common origin according to cancer type

        public static string query9 = "SELECT CancerType, MAX(NoOfPatients)" +
                                       "FROM(" +
                                           "SELECT o.name AS Origin, s.site_name AS CancerType, COUNT(c.Patient_ID) AS NoOfPatients" +
                                           "FROM PSelugar.Case c" +
                                           "JOIN MVDOSHI.origin_master o ON o.num = c.Site_Label" +
                                           "JOIN MVDOSHI.Site_master s ON s.site_ID = c.site" +
                                           "GROUP BY s.site_name, o.name" +
                                           "ORDER BY s.site_name)" +
                                       "GROUP BY CancerType" +
                                       "ORDER BY CancerType";


        // Percent of people alive after a particular surgery group by cancer type : Display Pie Chart

        public static string query10 = "SELECT CancerType1,AliveCount/TotalCount*100 AS PercentageOfAlive" +
                                        "FROM" +
                                         "(SELECT s.site_name AS CancerType1, COUNT(c.Patient_ID) AS TotalCount" +
                                            "FROM PSelugar.Case c" +
                                            "JOIN MVDOSHI.site_master s ON s.Site_ID = c.Site" +
                                            "WHERE c.SUR_PRIM_SITE NOT IN ('None','Blank(s)')" +
                                            "GROUP BY s.site_name)," +

                                            "(SELECT DISTINCT s.site_name AS CancerType2, COUNT(c.Patient_ID) AS AliveCount" +
                                            "FROM PSelugar.Case c" +
                                            "JOIN MVDOSHI.site_master s ON s.Site_ID = c.Site" +
                                            "WHERE c.Vital_Status = 'Alive' AND c.SUR_PRIM_SITE NOT IN ('None','Blank(s)')" +
                                            "GROUP BY s.site_name) " +
                                        "Where CancerType1 = CancerType2" +
                                        "ORDER BY CancerType1";

        // Incidence rate of patients depending on state
        public static string query11 = "WITH ResidentsCount(PatientNo, StateCode) AS(" +
                                            "SELECT COUNT(Patient_ID), SUBSTR(CODE,0,2)" +
                                            "FROM Mvdoshi.Resident" +
                                            "WHERE SUBSTR(CODE,0,2) NOT IN(15,97,98)" +
                                            "GROUP BY SUBSTR(CODE,0,2))" +

                                            "SELECT S_Name AS State,ROUND(((PatientNo/Population)*100),2) AS IncidenceRate" +
                                            "FROM MVDOSHI.state_master s" +
                                            "JOIN ResidentsCount r ON s.S_ID = r.StateCode";


    }
}