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
    
    public partial class tblCiudades
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblCiudades()
        {
            this.tblClientes = new HashSet<tblClientes>();
        }
    
        public int IDCiudad { get; set; }
        public string CodigoCiudad { get; set; }
        public string NombreCiudad { get; set; }
        public int IDDepartamento { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public string UsuarioUltimaModificacion { get; set; }
    
        public virtual tblDepartamentos tblDepartamentos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblClientes> tblClientes { get; set; }
    }
}
