namespace CancerAnalysis.Model
{
    public class CancerCase
    {
        public CancerCase() { }

        public string CancerType { get; set; }
        public long TotalCases { get; set; }
        public long TotalDeaths { get; set; }
        public string PercentOfPeopleAlive { get; set; }
        public string Origin { get; set; }
    }
}