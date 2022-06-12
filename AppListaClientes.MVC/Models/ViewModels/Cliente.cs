using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Xunit.Sdk;

namespace AppListaClientes.MVC.Models.ViewModels
{
    public class Cliente
    {
        public int IDCliente { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [StringLength(25)]
        [Display(Name = "Nit")]
        public string NitCliente { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [StringLength(50)]
        [Display(Name = "Primer Nombre")]
        public string PrimerNombre { get; set; }

        [StringLength(50)]
        [Display(Name = "Segundo Nombre")]
        public string SegundoNombre { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [StringLength(50)]
        [Display(Name = "Primer Apellido")]
        public string PrimerApellido { get; set; }

        [StringLength(50)]
        [Display(Name = "Segundo Apellido")]
        public string SegundoApellido { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [StringLength(100)]
        [Display(Name = "Telefono")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [StringLength(1000)]
        [Display(Name = "Direccion")]
        public string Direccion { get; set; }

        [Display(Name = "Ciudad")]
        public int IDCiudad { get; set; }
        public string strNombreCiudad { get; set; }
        public string NombreDepartamento { get; set; }
        [Required(ErrorMessage = "Este campo es requerido")]
        [EmailAddress]
        [Display(Name = "Correo")]
        public string Correo { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public string UsuarioUltimaModificacion { get; set; }
    }
}