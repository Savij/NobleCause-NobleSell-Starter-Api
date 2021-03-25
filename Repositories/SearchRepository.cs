using Dapper;
using Microsoft.Extensions.Options;
using NobleCause.NobleSell.Api.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace NobleCause.NobleSell.Api.Repositories
{
    public class SearchRepository : ISearchRepository
    {
        private readonly DatabaseSettings _databaseSettings;

        public SearchRepository(IOptions<DatabaseSettings> databaseSettings)
        {
            _databaseSettings = databaseSettings.Value;
        }

        public async Task<SearchResultDetail> GetItemById(int itemId)
        {
            await using var connection = new SqlConnection(_databaseSettings.ConnectionString);

            var procParams = new DynamicParameters();
            procParams.Add("@ItemId", itemId);
            var searchResults = await connection.QueryAsync<SearchResultDetail>("usp_Items_GetById",
                                                                        procParams,
                                                                        commandType: CommandType.StoredProcedure);
            return searchResults.FirstOrDefault();
        }

        public async Task<IEnumerable<SearchResult>> GetSearchResults(SearchCriteria criteria)
        {
            await using var connection = new SqlConnection(_databaseSettings.ConnectionString);

            var searchResults = await connection.QueryAsync<SearchResult>("usp_Items_Get",
                                                                        null,
                                                                        commandType: CommandType.StoredProcedure);
            return searchResults?.ToList();
        }
    }
}
