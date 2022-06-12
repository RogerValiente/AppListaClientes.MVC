using AppListaClientes.MVC.Models;
using AppListaClientes.MVC.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AppListaClientes.MVC.Business
{
    public class Clientes
    {

        //Conexión base de datos
        private dbPruebaEntities _db = new dbPruebaEntities();

        //Metodo para obtener todos los clientes
        public Resultado.RSV_Resultado<List<usp_Clientes_Obtener_Result>> Obtener()
        {
            Resultado.RSV_Resultado<List<usp_Clientes_Obtener_Result>> infoResultado = new Resultado.RSV_Resultado<List<usp_Clientes_Obtener_Result>>();

            try
            {
                var lista = _db.usp_Clientes_Obtener().ToList();
                infoResultado.Datos = lista;
                infoResultado.Error = null;
                infoResultado.Exitoso = true;

            }
            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Datos = null;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.Message));
            }
            finally
            {
                _db = null;
            }

            return infoResultado;
        }


        //Metodo Consultar un cliente por ID
        public usp_Clientes_Consultar_Result Consultar(int? IdCliente)
        {

            usp_Clientes_Consultar_Result cliente = new usp_Clientes_Consultar_Result();

            try
            {
                cliente = _db.usp_Clientes_Consultar(IdCliente).FirstOrDefault();
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }


            return cliente;
        }

        //Metodo para actualizar o crear un cliente
        public Resultado.RSV_Resultado<Cliente> Actualizar(Cliente cliente)
        {
            Resultado.RSV_Resultado<Cliente> infoResultado = new Resultado.RSV_Resultado<Cliente>();

            try
            {
                //Llamo el procedimiento almacenado
                cliente.IDCliente = _db.usp_Clientes_Actualizar(cliente.IDCliente, cliente.NitCliente, cliente.PrimerNombre,
                cliente.SegundoNombre, cliente.PrimerApellido, cliente.SegundoApellido, cliente.Telefono,
                cliente.Direccion, cliente.IDCiudad, cliente.Correo, DateTime.Now, cliente.UsuarioCreacion);
                infoResultado.Datos = cliente;
                infoResultado.Error = null;
                infoResultado.Exitoso = true;
            }
            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Datos = null;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.Message));

            }
            finally
            {
                _db = null;
            }

            return infoResultado;
        }
        //Metodo para eliminar un cliente por IDCliente
        public Resultado.RSV_ResultadoEjecucion Eliminar(int IDCliente)
        {
            Resultado.RSV_ResultadoEjecucion infoResultado = new Resultado.RSV_ResultadoEjecucion();

            try
            {
                _db.usp_Clientes_Eliminar(IDCliente);
                infoResultado.Exitoso = true;
            }
            catch (Exception ex)
            {
                infoResultado.Exitoso = false;
                infoResultado.Error = Errores.LlenarError(ex, string.Format("Se presentó un error en el método {0}. {1}",
                    ((System.Reflection.MethodInfo)(System.Reflection.MethodInfo.GetCurrentMethod())).Name.ToString(), ex.Message));

            }
            finally
            {
                _db = null;
            }

            return infoResultado;
        }
    }
}