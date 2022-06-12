using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace AppListaClientes.MVC.Models.ViewModels
{
    [DataContract]
    public class Error
    {
        private string strMensajeUsuario = string.Empty;
        private string strMensaje = string.Empty;
        private string strTipoError = string.Empty;
        private string strFuente = string.Empty;
        private string strPila = string.Empty;
        private string strMensajeInnerException = null;

        [DataMember]
        public string MensajeUsuario
        {
            get { return strMensajeUsuario; }
            set { strMensajeUsuario = value; }
        }

        [DataMember]
        public string Mensaje
        {
            get { return strMensaje; }
            set { strMensaje = value; }
        }

        [DataMember]
        public string TipoError
        {
            get { return strTipoError; }
            set { strTipoError = value; }
        }

        [DataMember]
        public string Fuente
        {
            get { return strFuente; }
            set { strFuente = value; }
        }

        [DataMember]
        public string Pila
        {
            get { return strPila; }
            set { strPila = value; }
        }

        [DataMember]
        public string InnerException
        {
            get { return strMensajeInnerException; }
            set { strMensajeInnerException = value; }
        }
    }
  }