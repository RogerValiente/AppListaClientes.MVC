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
    public class DepartamentosController : Controller
    {
        private dbPruebaEntities db = new dbPruebaEntities();

        // GET: Departamentos
        public ActionResult Index()
        {
            return View(db.tblDepartamentos.ToList());
        }

        // GET: Departamentos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblDepartamentos tblDepartamentos = db.tblDepartamentos.Find(id);
            if (tblDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tblDepartamentos);
        }

        // GET: Departamentos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Departamentos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDDepartamento, CodigoDepartamento, NombreDepartamento, FechaCreacion, UsuarioCreacion, " +
            "FechaUltimaModificacion, UsuarioUltimaModificacion")] tblDepartamentos tblDepartamentos)
        {
            tblDepartamentos.FechaCreacion = DateTime.Now;
            tblDepartamentos.UsuarioCreacion = "Admin";
            if (ModelState.IsValid)
            {
                db.tblDepartamentos.Add(tblDepartamentos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblDepartamentos);
        }


        // GET: Departamentos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblDepartamentos tblDepartamentos = db.tblDepartamentos.Find(id);
            if (tblDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tblDepartamentos);
        }

        // POST: Departamentos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDDepartamento, CodigoDepartamento, NombreDepartamento, FechaCreacion,  UsuarioCreacion")] tblDepartamentos tblDepartamentos)
        {
            tblDepartamentos.FechaCreacion = DateTime.Now;
            tblDepartamentos.UsuarioCreacion = "Admin";

            if (ModelState.IsValid)
            {
                db.Entry(tblDepartamentos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblDepartamentos);
        }

        // GET: Departamentos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblDepartamentos tblDepartamentos = db.tblDepartamentos.Find(id);
            if (tblDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tblDepartamentos);
        }

        // POST: Departamentos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblDepartamentos tblDepartamentos = db.tblDepartamentos.Find(id);
            db.tblDepartamentos.Remove(tblDepartamentos);
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
