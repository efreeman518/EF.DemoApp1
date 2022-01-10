using System.Threading;
using System.Threading.Tasks;

namespace Infrastructure.Data;

public interface IRepositoryBase
{
    Task<int> SaveChangesAsync(string auditId, CancellationToken cancellationToken = default);
}
