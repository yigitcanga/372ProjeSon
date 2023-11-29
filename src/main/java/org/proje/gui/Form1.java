package org.proje.gui;

import org.proje.gui.tableModels.*;
import org.proje.jdbc.dao.*;
import org.proje.jdbc.model.*;

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
        giderCombo.addItem("Gider Tarihi");

        stokCombo.addItem("Stok Numarası");
        stokCombo.addItem("Stok Türü");
        stokCombo.addItem("Stok Miktarı");
        stokCombo.addItem("Stok Kurum Numarası");

        //Umarım bitmiş personel sekmesi
        personelBilgisiButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            closeAllBut(1);

            persAtt.setVisible(!persAtt.isVisible());
            //persAttButton.setVisible(!persAttButton.isVisible());
            persCombo.setVisible(!persCombo.isVisible());

            persCombo.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    String selectedOption = persCombo.getSelectedItem().toString();
                    String yeniBilgi = selectedOption + " giriniz.";
                    personelLabel.setText(yeniBilgi);


                }
            });

            button1.setVisible(!button1.isVisible());
            PersonelAtt.setVisible(!PersonelAtt.isVisible());
            personelLabel.setVisible(!personelLabel.isVisible());

            try {
                PersonelDAO pdao = new PersonelDAO();
                List<Personel> list =pdao.getAllPersonel();
                //Make a table for list
                PersonelTableModel model =new PersonelTableModel(list);
                table1.setModel(model);

            }catch (Exception e1 ){
                JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
            }

            //call data for current selection on the drop down menu

            button1.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    String enteredText = PersonelAtt.getText();
                    String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                    gelenBilgiLabel.setText(yeniBilgi);

                    try {
                        PersonelDAO pdao = new PersonelDAO();
                        String col ="";
                        System.out.println(persCombo.getSelectedIndex());
                        switch (persCombo.getSelectedIndex()){
                            case 0:
                                col="personel_id";
                                break;
                            case 1:
                                col="ad";
                                break;
                            case 2:
                                col="soyad";
                                break;
                            case 3:
                                col = "tc_kimlik";
                                break;
                            case 4:
                                col="tel_no";
                                break;
                            case 5:
                                col="mail";
                                break;
                            case 6:
                                col="adres";
                                break;
                            case 7:
                                col="maaş";
                                break;
                            case 8:
                                col="kurum_id";
                                break;
                            default:
                                col="ad";
                                break;
                        }
                        System.out.println(col);
                        System.out.println(enteredText);
                        List<Personel> list = pdao.searchForPersonel(col,enteredText);
                        //Make a table for list
                        PersonelTableModel model =new PersonelTableModel(list);
                        table1.setModel(model);

                    }catch (Exception e1 ){
                        JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                    }
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

                dersCombo.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String selectedOption = dersCombo.getSelectedItem().toString();
                        String yeniBilgi = selectedOption + " giriniz.";
                        dersLabel.setText(yeniBilgi);


                    }
                });

                button3.setVisible(!button3.isVisible());
                DersAtt.setVisible(!DersAtt.isVisible());
                dersLabel.setVisible(!dersLabel.isVisible());

                try {
                    DersDAO ddao = new DersDAO();
                    List<Ders> liste = ddao.getAllDers();
                    //Make a table for list
                    DersTableModel model =new DersTableModel(liste);
                    table1.setModel(model);

                }catch (Exception e1 ){
                    JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                }

                button3.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = DersAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        try {
                            DersDAO ddao = new DersDAO();
                            OgretmenDAO ogretmenDAO = new OgretmenDAO();
                            OgrenciDAO ogrenciDAO = new OgrenciDAO();
                            String col ="";
                            //System.out.println(dersCombo.getSelectedIndex());

                            List<Ders> list = null;
                            List<Dersler> dersler = null;
                            switch (dersCombo.getSelectedIndex()){
                                case 0:
                                    col="ders_kodu";
                                    list = ddao.searchForDers(col,enteredText);
                                    break;
                                case 1:
                                    col="ders_adı";
                                    list = ddao.searchForDers(col,enteredText);
                                    break;
                                case 2:
                                    col = "okul_no";
                                    dersler = ogrenciDAO.getDersler(enteredText);
                                    break;
                                case 3:
                                    col = "personel_id";
                                    dersler = ogretmenDAO.getDersler(enteredText);
                                    break;
                                default:
                                    col="ders_kodu";
                                    break;
                            }
                            //System.out.println(col);
                            //System.out.println(enteredText);
                            //List<Ders> list = ddao.searchForDers(col,enteredText);
                            //Make a table for list

                            if(list!=null){
                                DersTableModel model =new DersTableModel(list);
                                table1.setModel(model);
                            } else if (dersler!=null) {
                                OgrDersTableModel model1 =new OgrDersTableModel(dersler);
                                table1.setModel(model1);
                            }

                        }catch (Exception e1 ){
                            JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                        }
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

                giderCombo.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String selectedOption = giderCombo.getSelectedItem().toString();
                        String yeniBilgi = selectedOption + " giriniz.";
                        giderLabel.setText(yeniBilgi);


                    }
                });

                button4.setVisible(!button4.isVisible());
                GiderAtt.setVisible(!GiderAtt.isVisible());
                giderLabel.setVisible(!giderLabel.isVisible());


                try {
                    KurumGiderleriDAO kdao = new KurumGiderleriDAO();
                    List<KurumGiderleri> list = kdao.getAllKurumGiderleri();
                    //Make a table for list
                    GiderTableModel model =new GiderTableModel(list);
                    table1.setModel(model);

                }catch (Exception e1 ){
                    JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                }

                button4.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = GiderAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        try {
                            KurumGiderleriDAO kdao = new KurumGiderleriDAO();
                            String col ="";
                            System.out.println(giderCombo.getSelectedIndex());
                            switch (giderCombo.getSelectedIndex()){
                                case 0:
                                    col="gider_id";
                                    break;
                                case 1:
                                    col="gider";
                                    break;
                                case 2:
                                    col="tutar";
                                    break;
                                case 3:
                                    col="kurum_id";
                                    break;
                                case 9:
                                    col="tarih";
                                    break;
                                default:
                                    col="gider";
                                    break;
                            }
                            System.out.println(col);
                            System.out.println(enteredText);
                            List<KurumGiderleri> list = kdao.searchForGider(col,enteredText);
                            //Make a table for list
                            GiderTableModel model =new GiderTableModel(list);
                            table1.setModel(model);

                        }catch (Exception e1 ){
                            JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                        }
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

                stokCombo.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String selectedOption = stokCombo.getSelectedItem().toString();
                        String yeniBilgi = selectedOption + " giriniz.";
                        stokLabel.setText(yeniBilgi);


                    }
                });

                button5.setVisible(!button5.isVisible());
                StokAtt.setVisible(!StokAtt.isVisible());
                stokLabel.setVisible(!stokLabel.isVisible());

                try {
                    StokDAO sdao = new StokDAO();
                    List<Stok> list = sdao.getAllStok();
                    //Make a table for list
                    StokTableModel model =new StokTableModel(list);
                    table1.setModel(model);

                }catch (Exception e1 ){
                    JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                }

                button5.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StokAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        try {
                            StokDAO sdao = new StokDAO();
                            String col ="";
                            System.out.println(stokCombo.getSelectedIndex());
                            switch (stokCombo.getSelectedIndex()){
                                case 0:
                                    col="stok_id";
                                    break;
                                case 1:
                                    col="stok_türü";
                                    break;
                                case 2:
                                    col="miktar";
                                    break;
                                case 3:
                                    col="kurum_id";
                                    break;
                                default:
                                    col="stok_turu";
                                    break;
                            }
                            System.out.println(col);
                            System.out.println(enteredText);
                            List<Stok> list = sdao.searchForStok(col,enteredText);
                            //Make a table for list
                            StokTableModel model =new StokTableModel(list);
                            table1.setModel(model);

                        }catch (Exception e1 ){
                            JOptionPane.showMessageDialog(Form1.this,"Error:"+e1,"Error",JOptionPane.ERROR_MESSAGE);
                        }
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
