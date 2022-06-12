using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace AppListaClientes.MVC.Models.ViewModels
{
    public class Resultado
    {
        private bool blnExitoso = false;
        private Error exException = null;
        //private int intCantidadPaginas = 1;

        [DataMember()]
        public bool Exitoso
        {
            get { return blnExitoso; }
            set { blnExitoso = value; }
        }

        [DataMember()]
        public Error Error
        {
            get { return exException; }
            set { exException = value; }
        }
        public class RSV_Resultado<T> : Resultado
        {
            T colDatos;

            [DataMember]
            public T Datos
            {
                get { return colDatos; }
                set { colDatos = value; }
            }
        }

        public class RSV_ResultadoEjecucion : Resultado
        {
            private int intRegistrosAfectados = 0;
            //private int intIDRegistro = -1;
            private string strMensaje = string.Empty;

            public int RegistrosAfectados
            {
                get { return intRegistrosAfectados; }
                set { intRegistrosAfectados = value; }
            }
        }
    }
}