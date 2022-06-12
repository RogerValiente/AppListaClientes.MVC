using AppListaClientes.MVC.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppListaClientes.MVC.Business
{
    public class Errores
    {

        public enum TipoAuditoria
        {
            LOG,
            ERROR,
            INFO
        }

        public static Error LlenarError(Exception exception, string Mensaje)
        {
            Error infoError = new Error
            {
                Mensaje = exception.ToString(),
                TipoError = exception.GetType().Name,
                Fuente = exception.Source,
                Pila = exception.StackTrace,
                MensajeUsuario = Mensaje
            };
            if (exception.InnerException != null)
            {
                infoError.InnerException = exception.InnerException.ToString();
            }
            else
            {
                infoError.InnerException = string.Empty;
            }

            return infoError;
        }

        public static Error LlenarError(Exception exception)
        {
            Error infoError = new Error
            {
                Mensaje = exception.ToString(),
                TipoError = exception.GetType().Name,
                Fuente = exception.Source,
                Pila = exception.StackTrace,
                MensajeUsuario = exception.Message
            };
            if (exception.InnerException != null)
            {
                infoError.InnerException = exception.InnerException.ToString();
            }
            else
            {
                infoError.InnerException = string.Empty;
            }

            return infoError;
        }
    }
}