using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB_WebApp.Services;
using Microsoft.Extensions.Options;

namespace MongoDB_WebApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<PrisonDatabaseSettings>(
                Configuration.GetSection(nameof(PrisonDatabaseSettings)));
            services.AddSingleton<IPrisonDatabaseSettings>(sp =>
                sp.GetRequiredService<IOptions<PrisonDatabaseSettings>>().Value);

            services.AddSingleton<AcadProgrammeService>();
            services.AddSingleton<DrugRehabProgrammeService>();
            services.AddSingleton<InmateProgressService>();
            services.AddSingleton<InmateService>();
            services.AddSingleton<UsersService>();
            services.AddSingleton<VocationalProgrammeService>();
            services.AddSingleton<CounterService>();

            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
