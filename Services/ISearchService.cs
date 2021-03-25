using NobleCause.NobleSell.Api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NobleCause.NobleSell.Api.Services
{
    public interface ISearchService
    {
        Task<IEnumerable<SearchResult>> GetSearchResults(SearchCriteria criteria);
        Task<SearchResultDetail> GetItemById(int itemId);
    }
}
