package org.proje.gui;

import org.proje.gui.tableModels.OgrenciTableModel;
import org.proje.jdbc.dao.DAO;
import org.proje.jdbc.dao.OgrenciDAO;
import org.proje.jdbc.model.Ogrenci;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class Form1 extends JFrame {
    private JPanel panel1;
    private JButton personelBilgisiButton;
    private JButton öğrenciBilgisiButton;
    private JButton dersBilgisiButton;
    private JButton giderBilgisiButton;
    private JButton stokBilgisiButton;
    private JLabel gelenBilgiLabel;
    private JButton button1;
    private JButton button2;
    private JButton button3;
    private JButton button4;
    private JButton button5;
    private JLabel personelLabel;
    private JLabel studentLabel;
    private JLabel dersLabel;
    private JLabel giderLabel;
    private JLabel stokLabel;
    private JComboBox persCombo;
    private JLabel persAtt;
    private JLabel stuAtt;
    private JLabel dersAtt;
    private JLabel giderAtt;
    private JLabel stokAtt;
    private JButton persAttButton;
    private JButton stuAttButton;
    private JButton dersAttButton;
    private JButton giderAttButton;
    private JButton stokAttButton;
    private JComboBox stuCombo;
    private JComboBox dersCombo;
    private JComboBox giderCombo;
    private JComboBox stokCombo;
    private JTextField PersonelAtt;
    private JTextField StudentAtt;
    private JTextField DersAtt;
    private JTextField GiderAtt;
    private JTextField StokAtt;
    private JTable table1;

    public void closeAllBut(int i){
        switch (i){
            case 1 :
                kapatStokBilgisi();
                kapatDersBilgisi();
                kapatGiderBilgisi();
                kapatStudentBilgisi();
                break;
            case 2 :
                kapatPersonelBilgisi();
                kapatStokBilgisi();
                kapatGiderBilgisi();
                kapatDersBilgisi();
                break;
            case 3 :
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatGiderBilgisi();
                kapatStokBilgisi();
                break;
            case 4 :
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatDersBilgisi();
                kapatStokBilgisi();
                break;
            case 5 :
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatDersBilgisi();
                kapatGiderBilgisi();
                break;
            default:
                System.out.println("Error while closing tabs");
        }
    }

    public void kapatPersonelBilgisi(){
        persAtt.setVisible(false);
        persCombo.setVisible(false);
        PersonelAtt.setVisible(false);
        button1.setVisible(false);
        personelLabel.setVisible(false);
    }
    public void kapatDersBilgisi(){
        dersAtt.setVisible(false);
        dersCombo.setVisible(false);
        DersAtt.setVisible(false);
        button2.setVisible(false);
        dersLabel.setVisible(false);
    }

    public void kapatStudentBilgisi(){
        stuAtt.setVisible(false);
        stuCombo.setVisible(false);
        StudentAtt.setVisible(false);
        button3.setVisible(false);
        studentLabel.setVisible(false);
    }
    public void kapatGiderBilgisi(){
        giderAtt.setVisible(false);
        giderCombo.setVisible(false);
        GiderAtt.setVisible(false);
        button4.setVisible(false);
        giderLabel.setVisible(false);
    }
    public void kapatStokBilgisi(){
        stokAtt.setVisible(false);
        stokCombo.setVisible(false);
        StokAtt.setVisible(false);
        button5.setVisible(false);
        stokLabel.setVisible(false);
    }

    public Form1() {

        try{
            DAO dao = new DAO();
        }catch (Exception e){
            System.out.println(e);
            JOptionPane.showMessageDialog(this,"Error:"+e,"Error",JOptionPane.ERROR_MESSAGE);
        }

        add(panel1);
        this.setTitle("Bilgi Uygulaması");
        //this.setSize(400, 300);
        this.setBounds(200,100,1200,800);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        button1.setVisible(false);
        button2.setVisible(false);
        button3.setVisible(false);
        button4.setVisible(false);
        button5.setVisible(false);
        StudentAtt.setVisible(false);
        PersonelAtt.setVisible(false);
        DersAtt.setVisible(false);
        GiderAtt.setVisible(false);
        StokAtt.setVisible(false);
        personelLabel.setVisible(false);
        studentLabel.setVisible(false);
        dersLabel.setVisible(false);
        giderLabel.setVisible(false);
        stokLabel.setVisible(false);
        persCombo.setVisible(false);
        stuCombo.setVisible(false);
        dersCombo.setVisible(false);
        giderCombo.setVisible(false);
        stokCombo.setVisible(false);
        persAtt.setVisible(false);
        stuAtt.setVisible(false);
        dersAtt.setVisible(false);
        giderAtt.setVisible(false);
        stokAtt.setVisible(false);
        //persAttButton.setVisible(false);
        //stuAttButton.setVisible(false);
        //dersAttButton.setVisible(false);
        //giderAttButton.setVisible(false);
        //stokAttButton.setVisible(false);

        persCombo.addItem("Personel Numarası");
        persCombo.addItem("Personel Adı");
        persCombo.addItem("Personel Soyadı");
        persCombo.addItem("Personel TC Kimlik Numarası");
        persCombo.addItem("Personel Telefon Numarası");
        persCombo.addItem("Personel Mail adresi");
        persCombo.addItem("Personel Adresi");
        persCombo.addItem("Personel Maaşı");
        persCombo.addItem("Personel Kurum Numarası");

        stuCombo.addItem("Öğrenci Numarası");
        stuCombo.addItem("Öğrenci Adı");
        stuCombo.addItem("Öğrenci Soyadı");
        stuCombo.addItem("Öğrenci Doğum Tarihi");
        stuCombo.addItem("Öğrenci Mail Adresi");
        stuCombo.addItem("Öğrenci Telefon Numarası");
        stuCombo.addItem("Öğrenci Sınıfı");
        stuCombo.addItem("Öğrenci Adresi");
        stuCombo.addItem("Öğrenci Mezunluk Durumu");
        stuCombo.addItem("Öğrenci Kurum Numarası");
        stuCombo.addItem("Öğrenci TC Kimlik Numarası");

        dersCombo.addItem("Ders Kodu");
        dersCombo.addItem("Ders Adı");

        giderCombo.addItem("Gider Numarası");
        giderCombo.addItem("Gider Adı");
        giderCombo.addItem("Gider Tutarı");
        giderCombo.addItem("Gider Kurum Numarası");

        stokCombo.addItem("Stok Numarası");
        stokCombo.addItem("Stok Türü");
        stokCombo.addItem("Stok Miktarı");
        stokCombo.addItem("Stok Kurum Numarası");


        personelBilgisiButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            closeAllBut(1);

            persAtt.setVisible(!persAtt.isVisible());
            //persAttButton.setVisible(!persAttButton.isVisible());
            persCombo.setVisible(!persCombo.isVisible());

            String selectedOption = persCombo.getSelectedItem().toString();
            String yeniBilgi = selectedOption + " giriniz.";
            personelLabel.setText(yeniBilgi);

            button1.setVisible(!button1.isVisible());
            PersonelAtt.setVisible(!PersonelAtt.isVisible());
            personelLabel.setVisible(!personelLabel.isVisible());

            //call data for current selection on the drop down menu

            button1.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    String enteredText = PersonelAtt.getText();
                    String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                    gelenBilgiLabel.setText(yeniBilgi);
                }
            });

            }
        });
        //Bitmiş öğrenci sekmesi
        öğrenciBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                closeAllBut(2);
                stuAtt.setVisible(!stuAtt.isVisible());
                //stuAttButton.setVisible(!stuAttButton.isVisible());
                stuCombo.setVisible(!stuCombo.isVisible());

                stuCombo.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String selectedOption = stuCombo.getSelectedItem().toString();
                        String yeniBilgi = selectedOption + " giriniz.";
                        studentLabel.setText(yeniBilgi);


                    }
                });

                button2.setVisible(!button2.isVisible());
                StudentAtt.setVisible(!StudentAtt.isVisible());
                studentLabel.setVisible(!studentLabel.isVisible());

                try {
                    OgrenciDAO odao = new OgrenciDAO();
                    List<Ogrenci> list =odao.getAllOgrenci();
                    //Make a table for list
                    OgrenciTableModel model =new OgrenciTableModel(list);
                    table1.setModel(model);

                }catch (Exception e1 ){
                    JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                }

                button2.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StudentAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        try {
                            OgrenciDAO odao = new OgrenciDAO();
                            String col ="";
                            System.out.println(stuCombo.getSelectedIndex());
                            switch (stuCombo.getSelectedIndex()){
                                case 0:
                                    col="okul_no";
                                    break;
                                case 1:
                                    col="ad";
                                    break;
                                case 2:
                                    col="soyad";
                                    break;
                                case 3:
                                    col="doğum_tarihi";
                                    break;
                                case 4:
                                    col="mail";
                                    break;
                                case 5:
                                    col="tel_no";
                                    break;
                                case 6:
                                    col="sınıf";
                                    break;
                                case 7:
                                    col="adres";
                                    break;
                                case 8:
                                    col="mezun_mu";
                                    break;
                                case 9:
                                    col="kurum_id";
                                    break;
                                case 10:
                                    col = "tc_kimlik";
                                    break;
                                default:
                                    col="ad";
                                    break;
                            }
                            System.out.println(col);
                            System.out.println(enteredText);
                            List<Ogrenci> list = odao.searchForOgrenci(col,enteredText);
                            //Make a table for list
                            OgrenciTableModel model =new OgrenciTableModel(list);
                            table1.setModel(model);

                        }catch (Exception e1 ){
                            JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                        }

                    }
                });
            }
        });

        dersBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                closeAllBut(3);
                dersAtt.setVisible(!dersAtt.isVisible());
                //dersAttButton.setVisible(!dersAttButton.isVisible());
                dersCombo.setVisible(!dersCombo.isVisible());

                String selectedOption = dersCombo.getSelectedItem().toString();
                String yeniBilgi = selectedOption + " giriniz.";
                dersLabel.setText(yeniBilgi);

                button3.setVisible(!button3.isVisible());
                DersAtt.setVisible(!DersAtt.isVisible());
                dersLabel.setVisible(!dersLabel.isVisible());

                button3.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = DersAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });

            }
        });

        giderBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                closeAllBut(4);
                giderAtt.setVisible(!giderAtt.isVisible());
                //giderAttButton.setVisible(!giderAttButton.isVisible());
                giderCombo.setVisible(!giderCombo.isVisible());

                String selectedOption = giderCombo.getSelectedItem().toString();
                String yeniBilgi = selectedOption + " giriniz.";
                giderLabel.setText(yeniBilgi);

                button4.setVisible(!button4.isVisible());
                GiderAtt.setVisible(!GiderAtt.isVisible());
                giderLabel.setVisible(!giderLabel.isVisible());

                button4.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = GiderAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });

            }
        });

        stokBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                closeAllBut(5);
                stokAtt.setVisible(!stokAtt.isVisible());
                //stokAttButton.setVisible(!stokAttButton.isVisible());
                stokCombo.setVisible(!stokCombo.isVisible());

                String selectedOption = stokCombo.getSelectedItem().toString();
                String yeniBilgi = selectedOption + " giriniz.";
                stokLabel.setText(yeniBilgi);

                button5.setVisible(!button5.isVisible());
                StokAtt.setVisible(!StokAtt.isVisible());
                stokLabel.setVisible(!stokLabel.isVisible());

                button5.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StokAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });

            }
        });


        this.add(panel1);
        this.setVisible(true);

    }

    private void createUIComponents() {
        gelenBilgiLabel = new JLabel();
    }


}
