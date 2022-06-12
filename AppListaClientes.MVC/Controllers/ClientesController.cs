using AppListaClientes.MVC.Business;
using AppListaClientes.MVC.Models;
using AppListaClientes.MVC.Models.ViewModels;
using System;
using System.Web.Mvc;

namespace AppListaClientes.MVC.Controllers
{
    public class ClientesController : Controller
    {

        //Conexión base de datos
        private dbPruebaEntities _db = new dbPruebaEntities();

        // GET: Clientes
        [HttpGet]
        public ActionResult Obtener()
        {
            Resultado.RSV_Resultado<usp_Clientes_Obtener_Result> infoResultado = new Resultado.RSV_Resultado<usp_Clientes_Obtener_Result>();

            try
            {
                ViewBag.clientes = new Clientes().Obtener().Datos;
                return View();
            }
            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Datos = null;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.ToString()));
            }
            return View();
        }

        [HttpGet]
        public ActionResult NuevoCliente()
        {
            CargarCiudades();
            return View();
        }

        [HttpGet]
        private void CargarCiudades()
        {
            ViewBag.ciudades = new Ciudades().Obtener();
        }

        // GET: Clientes/NuevoCliente/cliente
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NuevoCliente(Cliente cliente)
        {
            Resultado.RSV_Resultado<Cliente> infoResultado = new Resultado.RSV_Resultado<Cliente>();


            try
            {
                if (ModelState.IsValid)
                {
                    infoResultado = new Clientes().Actualizar(cliente);
                    //_db.SaveChangesAsync();
                    return RedirectToAction("Obtener");
                }

            }
            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Datos = null;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.ToString()));
            }
            CargarCiudades();
            return View(cliente);
        }


        // GET: Clientes/Editar/ID
        [HttpGet]
        public ActionResult Editar(int? IDCliente)
        {
            usp_Clientes_Consultar_Result infoResultado = new usp_Clientes_Consultar_Result();

            try
            {
                infoResultado = new Clientes().Consultar(IDCliente);
                CargarCiudades();
                return View(infoResultado);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }

        }

        //POST: Clientes/Editar/ID
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Cliente cliente)
        {
            Resultado.RSV_Resultado<Cliente> infoResultado = new Resultado.RSV_Resultado<Cliente>();

            try
            {
                infoResultado = new Clientes().Actualizar(cliente);
                infoResultado.Error = null;
                infoResultado.Exitoso = true;
                return RedirectToAction("Obtener");
            }

            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Datos = null;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.Message));

            }

            return View(cliente);
        }

        //POST: Clientes/Eliminar/ID
        [HttpPost]
        public ActionResult Eliminar(int IDCliente)
        {
            Resultado.RSV_ResultadoEjecucion infoResultado = new Resultado.RSV_ResultadoEjecucion();

            try
            {
                infoResultado = new Clientes().Eliminar(IDCliente);
                infoResultado.Exitoso = true;
            }

            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.Message));
            }

            return RedirectToAction("Obtener");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}