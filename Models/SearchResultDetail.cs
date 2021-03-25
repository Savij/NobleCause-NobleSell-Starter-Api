using System;

namespace NobleCause.NobleSell.Api.Models
{
    public class SearchResultDetail
    {
        public int ItemId { get; set; }
        public bool IsNewListing { get; set; }
        public string ImagePath { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public decimal Price { get; set; }
        public DateTime DatePosted { get; set; }

    }
}
