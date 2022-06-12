using AppListaClientes.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AppListaClientes.MVC.Business
{
    public class Ciudades
    {
        #region Variables
        public int IDCiudad { get; set; }
        public string CodigoCiudad { get; set; }
        public string NombreCiudad { get; set; }
        public int IDDepartamento { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public string UsuarioUltimaModificacion { get; set; }
        public virtual tblDepartamentos tblDepartamentos { get; set; }
        #endregion

        #region Metodo Obtener Nombre Ciudades
        //Conexión base de datos
        private dbPruebaEntities _db = new dbPruebaEntities();
        public List<Ciudades> Obtener()
        {
            return _db.tblCiudades.Select(c => new Ciudades()
            {
                IDCiudad = c.IDCiudad,
                NombreCiudad = c.NombreCiudad,
            }).ToList();
        }
        #endregion
    }
}