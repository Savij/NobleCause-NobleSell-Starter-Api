namespace NobleCause.NobleSell.Api.Models
{
    public class SearchResult
    {
        public int ItemId { get; set; }
        public string ImagePath { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public decimal Price { get; set; }
    }
}
