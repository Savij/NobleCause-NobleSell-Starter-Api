using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using NobleCause.NobleSell.Api.Models;
using NobleCause.NobleSell.Api.Repositories;
using NobleCause.NobleSell.Api.Services;

namespace NobleCause.NobleSell.Api
{
    public class Startup
    {
        private readonly string allowedOrigins = "_allowedOrigins";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(allowedOrigins,
                                  corsBuilder => corsBuilder
                                                 .WithOrigins("http://localhost:3000")
                                                 .SetIsOriginAllowedToAllowWildcardSubdomains()
                                                 .AllowAnyHeader()
                                                 .AllowAnyMethod()
                );
            });

            var dbSettingsConfig = Configuration.GetSection("DatabaseSettings");
            services.Configure<DatabaseSettings>(dbSettingsConfig);
            services.AddApiVersioning(apiVersioningOptions =>
            {
                apiVersioningOptions.ReportApiVersions = true;
                apiVersioningOptions.AssumeDefaultVersionWhenUnspecified = true;
                apiVersioningOptions.DefaultApiVersion = new ApiVersion(1, 0);
            });
            services.AddControllers();
            services.AddSingleton<ISearchService, SearchService>();
            services.AddSingleton<ISearchRepository, SearchRepository>();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "NobleCause.NobleSell.Api", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors(allowedOrigins);
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "NobleCause.NobleSell.Api v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
