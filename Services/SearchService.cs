using NobleCause.NobleSell.Api.Models;
using NobleCause.NobleSell.Api.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NobleCause.NobleSell.Api.Services
{
    public class SearchService : ISearchService
    {
        private readonly ISearchRepository _searchRepository;

        public SearchService(ISearchRepository searchRepository)
        {
            _searchRepository = searchRepository;
        }

        public async Task<SearchResultDetail> GetItemById(int itemId)
        {
            return await _searchRepository.GetItemById(itemId);
        }

        public async Task<IEnumerable<SearchResult>> GetSearchResults(SearchCriteria criteria)
        {
            return await _searchRepository.GetSearchResults(criteria);
        }
    }
}
