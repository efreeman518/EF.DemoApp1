
using Domain.Shared.Enums;
using ECS.Infrastructure.Data;

namespace Domain.Model
{
    public class TodoItem : EntityBase
    {
        public string Name { get; set; } = null!;
        public bool IsComplete { get; set; }
        public Status Status { get; set; }
    }
}
