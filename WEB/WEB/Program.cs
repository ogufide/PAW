using JN_WEB.Models;
using WEB.Models;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddHttpClient();
builder.Services.AddHttpContextAccessor();

builder.Services.AddScoped<IUsuarioModel, UsuarioModel>();
builder.Services.AddScoped<IComunModel, ComunModel>();
builder.Services.AddScoped<IRolModel, RolModel>();
builder.Services.AddScoped<IClasesModel, ClasesModel>();
builder.Services.AddScoped<IClientesModel, ClientesModel>();
builder.Services.AddScoped<IEmpleadosModel, EmpleadosModel>();
builder.Services.AddScoped<IGimnasiosModel, GimnasiosModel>();
builder.Services.AddScoped<IInscripcionClaseModel, InscripcionClaseModel>();
builder.Services.AddScoped<IMembresiaModel, MembresiaModel>();
<<<<<<< HEAD
builder.Services.AddScoped<IProvinciasModel, ProvinciasModel>();
=======
builder.Services.AddScoped<IProductoModel, ProductoModel>();
>>>>>>> 84d04fff914028de4d51304a2b3aadfcf1f24d9c


var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseSession();
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Login}/{id?}");

app.Run();
