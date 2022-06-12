using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppListaClientes.MVC.Models;

namespace AppListaClientes.MVC.Controllers
{
    public class CiudadesController : Controller
    {
        private dbPruebaEntities db = new dbPruebaEntities();

        // GET: Ciudades
        public ActionResult Index()
        {
            var tblCiudades = db.tblCiudades.Include(t => t.tblDepartamentos);
            return View(tblCiudades.ToList());
        }

        // GET: Ciudades/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCiudades tblCiudades = db.tblCiudades.Find(id);
            if (tblCiudades == null)
            {
                return HttpNotFound();
            }
            return View(tblCiudades);
        }

        // GET: Ciudades/Create
        public ActionResult Create()
        {
            ViewBag.IDDepartamento = new SelectList(db.tblDepartamentos, "IDDepartamento", "NombreDepartamento");
            return View();
        }

        // POST: Ciudades/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDCiudad, CodigoCiudad, NombreCiudad, IDDepartamento, FechaCreacion, UsuarioCreacion, FechaUltimaModificacion," +
            "UsuarioUltimaModificacion")] tblCiudades tblCiudades)
        {
            tblCiudades.FechaCreacion = DateTime.Now;
            tblCiudades.UsuarioCreacion = "Admin";


            if (ModelState.IsValid)
            {
                db.tblCiudades.Add(tblCiudades);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDDepartamento = new SelectList(db.tblDepartamentos, "IDDepartamento", "NombreDepartamento", tblCiudades.IDDepartamento);
            return View(tblCiudades);
        }

        // GET: Ciudades/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCiudades tblCiudades = db.tblCiudades.Find(id);
            if (tblCiudades == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDDepartamento = new SelectList(db.tblDepartamentos, "IDDepartamento", "NombreDepartamento", tblCiudades.IDDepartamento);
            return View(tblCiudades);
        }

        // POST: Ciudades/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDCiudad, CodigoCiudad, NombreCiudad, IDDepartamento, FechaCreacion, UsuarioCreacion, FechaUltimaModificacion," +
            "UsuarioUltimaModificacion")] tblCiudades tblCiudades)
        {
            tblCiudades.FechaUltimaModificacion = DateTime.UtcNow;
            tblCiudades.FechaCreacion = DateTime.UtcNow;
            tblCiudades.UsuarioUltimaModificacion = "Admin";
            tblCiudades.UsuarioCreacion = "Admin";

            if (ModelState.IsValid)
            {
                db.Entry(tblCiudades).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDDepartamento = new SelectList(db.tblDepartamentos, "IDDepartamento", "NombreDepartamento", tblCiudades.IDDepartamento);
            return View(tblCiudades);
        }

        // GET: Ciudades/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCiudades tblCiudades = db.tblCiudades.Find(id);
            if (tblCiudades == null)
            {
                return HttpNotFound();
            }
            return View(tblCiudades);
        }

        // POST: Ciudades/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblCiudades tblCiudades = db.tblCiudades.Find(id);
            db.tblCiudades.Remove(tblCiudades);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
