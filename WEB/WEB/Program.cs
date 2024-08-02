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
