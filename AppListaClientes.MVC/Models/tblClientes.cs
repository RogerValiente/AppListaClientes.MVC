//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppListaClientes.MVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblClientes
    {
        public int IDCliente { get; set; }
        public string NitCliente { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public int IDCiudad { get; set; }
        public string Correo { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public string UsuarioUltimaModificacion { get; set; }
    
        public virtual tblCiudades tblCiudades { get; set; }
    }
}
