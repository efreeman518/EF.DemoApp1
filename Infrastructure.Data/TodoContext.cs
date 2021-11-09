using Domain.Model;
using ECS.Infrastructure.Data;
using Infrastructure.Data.Configuration;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace Infrastructure.Data
{
    public class TodoContext : DbContextBase
    {
        public TodoContext(DbContextOptions<TodoContext> options)
            : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //schema
            modelBuilder.HasDefaultSchema("todo");

            //datatype defaults for sql
            //decimal
            foreach (var property in modelBuilder.Model.GetEntityTypes()
                .SelectMany(t => t.GetProperties())
                .Where(p => p.ClrType == typeof(decimal) || p.ClrType == typeof(decimal?)))
            {
                if (property.GetColumnType() == null) property.SetColumnType("decimal(10,4)");
            }
            //dates
            foreach (var property in modelBuilder.Model.GetEntityTypes()
                .SelectMany(t => t.GetProperties())
                .Where(p => p.ClrType == typeof(DateTime) || p.ClrType == typeof(DateTime?)))
            {
                if (property.GetColumnType() == null) property.SetColumnType("datetime2");
            }

            //table configurations
            //modelBuilder.ApplyConfiguration(new TodoItemConfiguration());
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(TodoContext).Assembly);
        }

        //DbSets
        public DbSet<TodoItem> TodoItems { get; set; } = null!;
    }
}
