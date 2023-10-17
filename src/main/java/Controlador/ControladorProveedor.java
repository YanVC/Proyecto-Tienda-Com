
package Controlador;

import Modelo.ModeloProveedor;
import Vista.Proveedor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ControladorProveedor implements ActionListener{
    Proveedor pro = new Proveedor();
    ModeloProveedor modpro = new ModeloProveedor();
 

    public ControladorProveedor() {
        pro.getBtnGuardarProveedor().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal();
            }
        });
    }

    public void iniciarProveedor() {
        pro.setVisible(true);
        pro.setLocationRelativeTo(null);
        pro.setTitle("Añadir Nuevo Proveedor | Ventana");

        pro.getJcbGenero().addItem("Seleccione...");
        Map<String, Integer> dato = modpro.llenarCombo("sexo");
        for (String sexo : dato.keySet()) {
            pro.getJcbGenero().addItem(sexo);
        }
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (pro.getBtnGuardarProveedor())) {

            if ((pro.getJcbGenero().getSelectedItem().equals("Seleccione...")) || (pro.getTxtNombre().getText().isEmpty()) || (pro.getTxtTelefono().getText().isEmpty()) || (pro.getTxtCorreo().getText().isEmpty()) || (pro.getTxtDireccion().getText().isEmpty()) || (pro.getJDFechadeNacimiento().getDate() == null) || (pro.getCbxTipoDeDocumento().getSelectedItem().equals("Seleccionar:")) || (pro.getCbxTipoDePersona().getSelectedItem().equals("Seleccionar:")))  {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {
                JOptionPane.showMessageDialog(null, "Exito");
                String valorSexo = pro.getJcbGenero().getSelectedItem().toString();
                int sexo = modpro.llenarCombo("sexo").get(valorSexo);
                java.util.Date fec = pro.getJDFechadeNacimiento().getDate();
                long fe = fec.getTime();
                java.sql.Date fecha = new Date(fe);

                modpro.setNom(pro.getTxtNombre().getText());
                modpro.setFec(fecha);
                modpro.setDir(pro.getTxtDireccion().getText());
                modpro.setTel(pro.getTxtTelefono().getText());
                modpro.setCor(pro.getTxtCorreo().getText());
                modpro.setSex(sexo);
                modpro.setTipdedeocu(pro.getCbxTipoDeDocumento().getSelectedItem().toString());
                modpro.setTipdeper(pro.getCbxTipoDePersona().getSelectedItem().toString());
                
                modpro.insertarProveedor();
                modpro.limpiarCasillas(pro.getJpPanelProveedor().getComponents());
            }
        }
    }
}
