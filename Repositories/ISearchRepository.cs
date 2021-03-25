using NobleCause.NobleSell.Api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NobleCause.NobleSell.Api.Repositories
{
    public interface ISearchRepository
    {
        Task<IEnumerable<SearchResult>> GetSearchResults(SearchCriteria criteria);
        Task<SearchResultDetail> GetItemById(int itemId);
    }
}
