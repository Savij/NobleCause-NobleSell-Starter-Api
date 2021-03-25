using Microsoft.AspNetCore.Mvc;
using NobleCause.NobleSell.Api.Models;
using NobleCause.NobleSell.Api.Services;
using System;
using System.Threading.Tasks;

namespace NobleCause.NobleSell.Api.Controllers
{
    [ApiVersion("1.0")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]")]
    public class SearchController : ControllerBase
    {
        private readonly ISearchService _searchService;

        public SearchController(ISearchService searchService)
        {
            _searchService = searchService;
        }

        [HttpPost]
        public async Task<IActionResult> Post(SearchCriteria criteria)
        {
            try
            {
               
                var response = await _searchService.GetSearchResults(criteria);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500);
            }
        }

        [HttpGet]
        [Route("details/{itemId}")]
        public async Task<IActionResult> Get(int itemId)
        {
            try
            {
                return Ok(await _searchService.GetItemById(itemId));
            }
            catch (Exception ex)
            {
                return StatusCode(500);
                throw;
            }
        }
    }
}
