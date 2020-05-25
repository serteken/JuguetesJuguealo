using JuguetesJuguealo.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace JuguetesJuguealo.Lógica
{
    internal class AccionesRol
    {
        internal void AddUserAndRole()
        {
            
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

          
            var roleStore = new RoleStore<IdentityRole>(context);

         
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

           
            if (!roleMgr.RoleExists("canEdit"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "canEdit" });
            }

        
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "Sergio Serrano",
                Email = "canEditUser@juguetesjuguealo.com"
            };
            IdUserResult = userMgr.Create(appUser, "Pa$$word1");

           
            if (!userMgr.IsInRole(userMgr.FindByEmail("canEditUser@juguetesjuguealo.com").Id, "canEdit"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("canEditUser@juguetesjuguealo.com").Id, "canEdit");
            }
        }
    }
}