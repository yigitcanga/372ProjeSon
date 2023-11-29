package org.proje.gui;

import org.proje.gui.tableModels.*;
import org.proje.jdbc.dao.*;
import org.proje.jdbc.model.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
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
    private JButton dersEkleButton;
    private JButton giderEkleButton;

    public void closeAllBut(int i) {
        switch (i) {
            case 1:
                kapatStokBilgisi();
                kapatDersBilgisi();
                kapatGiderBilgisi();
                kapatStudentBilgisi();
                break;
            case 2:
                kapatPersonelBilgisi();
                kapatStokBilgisi();
                kapatGiderBilgisi();
                kapatDersBilgisi();
                break;
            case 3:
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatGiderBilgisi();
                kapatStokBilgisi();
                break;
            case 4:
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatDersBilgisi();
                kapatStokBilgisi();
                break;
            case 5:
                kapatPersonelBilgisi();
                kapatStudentBilgisi();
                kapatDersBilgisi();
                kapatGiderBilgisi();
                break;
            default:
                System.out.println("Error while closing tabs");
        }
    }

    public void kapatPersonelBilgisi() {
        persAtt.setVisible(false);
        persCombo.setVisible(false);
        PersonelAtt.setVisible(false);
        button1.setVisible(false);
        personelLabel.setVisible(false);
    }

    public void kapatDersBilgisi() {
        dersAtt.setVisible(false);
        dersCombo.setVisible(false);
        DersAtt.setVisible(false);
        button3.setVisible(false);
        dersLabel.setVisible(false);
        dersEkleButton.setVisible(false);
    }

    public void kapatStudentBilgisi() {
        stuAtt.setVisible(false);
        stuCombo.setVisible(false);
        StudentAtt.setVisible(false);
        button2.setVisible(false);
        studentLabel.setVisible(false);
    }

    public void kapatGiderBilgisi() {
        giderAtt.setVisible(false);
        giderCombo.setVisible(false);
        GiderAtt.setVisible(false);
        button4.setVisible(false);
        giderLabel.setVisible(false);
        giderEkleButton.setVisible(false);
    }

    public void kapatStokBilgisi() {
        stokAtt.setVisible(false);
        stokCombo.setVisible(false);
        StokAtt.setVisible(false);
        button5.setVisible(false);
        stokLabel.setVisible(false);
    }

    public Form1() {

        try {
            DAO dao = new DAO();
        } catch (Exception e) {
            System.out.println(e);
            JOptionPane.showMessageDialog(this, "Error:" + e, "Error", JOptionPane.ERROR_MESSAGE);
        }

        add(panel1);
        this.setTitle("Bilgi Uygulaması");
        //this.setSize(400, 300);
        this.setBounds(200, 100, 1200, 800);
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
        dersEkleButton.setVisible(false);
        giderEkleButton.setVisible(false);
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
        persCombo.addItem("Müsait Zaman Part Time Personel Id");
        persCombo.addItem("Personel Türü Personel Id");

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
        stuCombo.addItem("Veli Ara");
        stuCombo.addItem("Tüm Veliler");
        stuCombo.addItem("Müsait Saatler Okul No");

        dersCombo.addItem("Ders Kodu");
        dersCombo.addItem("Ders Adı");
        dersCombo.addItem("Öğrenci Okul Numarası");
        dersCombo.addItem("Öğretmen Id");
        dersCombo.addItem("Tüm Bilgilerle Ders Kodu");
        dersCombo.addItem("Dersi Alan Bütün Öğrenciler");

        giderCombo.addItem("Gider Numarası");
        giderCombo.addItem("Gider Adı");
        giderCombo.addItem("Gider Tutarı");
        giderCombo.addItem("Gider Kurum Numarası");
        giderCombo.addItem("Gider Tarihi");
        giderCombo.addItem("Haftalık Gider Dökümü");
        giderCombo.addItem("Aylık Gider Dökümü");

        stokCombo.addItem("Stok");
        stokCombo.addItem("Stok Numarası");
        stokCombo.addItem("Stok Türü");
        stokCombo.addItem("Stok Miktarı");
        stokCombo.addItem("Stok Kurum Numarası");
        stokCombo.addItem("Stok Ders Kodu");

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
                    List<Personel> list = pdao.getAllPersonel();
                    //Make a table for list
                    PersonelTableModel model = new PersonelTableModel(list);
                    table1.setModel(model);

                } catch (Exception e1) {
                    JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
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
                            String col = "";
                            System.out.println(persCombo.getSelectedIndex());
                            List<Personel> list = null;
                            List<GunSaat> list1 = null;
                            List<PTurCalisan> list2 = null;
                            switch (persCombo.getSelectedIndex()) {
                                case 0:
                                    col = "personel_id";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 1:
                                    col = "ad";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 2:
                                    col = "soyad";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 3:
                                    col = "tc_kimlik";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 4:
                                    col = "tel_no";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 5:
                                    col = "mail";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 6:
                                    col = "adres";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 7:
                                    col = "maaş";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 8:
                                    col = "kurum_id";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                                case 9:
                                    list1 = pdao.getAllGS(enteredText);
                                    break;
                                case 10:
                                    list2 = pdao.getPTC(enteredText);
                                    break;
                                default:
                                    col = "ad";
                                    list = pdao.searchForPersonel(col, enteredText);
                                    break;
                            }
                            if (list != null) {
                                PersonelTableModel model = new PersonelTableModel(list);
                                table1.setModel(model);
                            } else if (list1 != null) {
                                MusaitTM model = new MusaitTM(list1);
                                table1.setModel(model);
                            }
                            else if (list2 != null) {
                                PTCTM model = new PTCTM(list2);
                                table1.setModel(model);
                            }


                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
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
                    List<Ogrenci> list = odao.getAllOgrenci();
                    //Make a table for list
                    OgrenciTableModel model = new OgrenciTableModel(list);
                    table1.setModel(model);

                } catch (Exception e1) {
                    JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                }

                button2.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StudentAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        try {
                            OgrenciDAO odao = new OgrenciDAO();
                            VeliDAO veli = new VeliDAO();
                            String col = "";
                            System.out.println(stuCombo.getSelectedIndex());

                            List<Ogrenci> list = null;
                            List<Veli> list1 = null;
                            List<GunSaat> list2 = null;

                            switch (stuCombo.getSelectedIndex()) {
                                case 0:
                                    col = "okul_no";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 1:
                                    col = "ad";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 2:
                                    col = "soyad";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 3:
                                    col = "doğum_tarihi";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 4:
                                    col = "mail";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 5:
                                    col = "tel_no";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 6:
                                    col = "sınıf";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 7:
                                    col = "adres";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 8:
                                    col = "mezun_mu";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 9:
                                    col = "kurum_id";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 10:
                                    col = "tc_kimlik";
                                    list = odao.searchForOgrenci(col, enteredText);
                                    break;
                                case 11:
                                    list1 = veli.searchForVeli(enteredText);
                                    break;
                                case 12:
                                    list1 = veli.getAllVeli();
                                    break;
                                case 13:
                                    list2 = odao.getAllGS(enteredText);
                                    break;
                                default:
                                    col = "ad";
                                    break;
                            }
                            System.out.println(col);
                            System.out.println(enteredText);
                            if (list != null) {

                                OgrenciTableModel model = new OgrenciTableModel(list);
                                table1.setModel(model);
                            } else if (list1 != null) {
                                VeliTableModel model = new VeliTableModel(list1);
                                table1.setModel(model);
                            } else if (list2 != null) {
                                MusaitTM model = new MusaitTM(list2);
                                table1.setModel(model);
                            }
                            //Make a table for list


                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
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
                        String selectedOption = "";

                        switch (dersCombo.getSelectedIndex()) {
                            case 4:
                                selectedOption = "Ders Kodu";
                                break;
                            default:
                                selectedOption = dersCombo.getSelectedItem().toString();
                                break;
                        }
                        String yeniBilgi = selectedOption + " giriniz.";
                        dersLabel.setText(yeniBilgi);


                    }
                });
                dersEkleButton.setVisible(!dersEkleButton.isVisible());
                button3.setVisible(!button3.isVisible());
                DersAtt.setVisible(!DersAtt.isVisible());
                dersLabel.setVisible(!dersLabel.isVisible());

                try {
                    DersDAO ddao = new DersDAO();
                    List<Ders> liste = ddao.getAllDers();
                    //Make a table for list
                    DersTableModel model = new DersTableModel(liste);
                    table1.setModel(model);

                } catch (Exception e1) {
                    JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                }
                dersEkleButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        DersDAO dersDAO = null;
                        try {
                            dersDAO = new DersDAO();
                        } catch (Exception ex) {
                            throw new RuntimeException(ex);
                        }
                        AddDers dialog = new AddDers(Form1.this, dersDAO);
                        dialog.setVisible(true);
                    }
                });

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
                            String col = "";
                            //System.out.println(dersCombo.getSelectedIndex());

                            List<Ders> list = null;
                            List<Dersler> dersler = null;
                            List<DersKoduTumBilgiler> ders = null;
                            List<Ogrenci> o = null;
                            switch (dersCombo.getSelectedIndex()) {
                                case 0:
                                    col = "ders_kodu";
                                    list = ddao.searchForDers(col, enteredText);
                                    break;
                                case 1:
                                    col = "ders_adı";
                                    list = ddao.searchForDers(col, enteredText);
                                    break;
                                case 2:
                                    col = "okul_no";
                                    dersler = ogrenciDAO.getDersler(enteredText);
                                    break;
                                case 3:
                                    col = "personel_id";
                                    dersler = ogretmenDAO.getDersler(enteredText);
                                    break;
                                case 4:
                                    ders = ddao.searchForDersAllAttrb(enteredText);
                                    break;
                                case 5:
                                    o = ogrenciDAO.getAllDersOgrenciMin(enteredText);
                                    break;
                                default:
                                    col = "ders_kodu";
                                    break;
                            }
                            //System.out.println(col);
                            //System.out.println(enteredText);
                            //List<Ders> list = ddao.searchForDers(col,enteredText);
                            //Make a table for list

                            if (list != null) {
                                DersTableModel model = new DersTableModel(list);
                                table1.setModel(model);
                            } else if (dersler != null) {
                                OgrDersTableModel model1 = new OgrDersTableModel(dersler);
                                table1.setModel(model1);
                            } else if (ders != null) {
                                DersTumTableModel model1 = new DersTumTableModel(ders);
                                table1.setModel(model1);
                            } else if (o != null) {
                                OgrMinTM model = new OgrMinTM(o);
                                table1.setModel(model);
                            }

                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
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

                giderEkleButton.setVisible(!giderEkleButton.isVisible());
                button4.setVisible(!button4.isVisible());
                GiderAtt.setVisible(!GiderAtt.isVisible());
                giderLabel.setVisible(!giderLabel.isVisible());


                try {
                    KurumGiderleriDAO kdao = new KurumGiderleriDAO();
                    List<KurumGiderleri> list = kdao.getAllKurumGiderleri();
                    //Make a table for list
                    GiderTableModel model = new GiderTableModel(list);
                    table1.setModel(model);

                } catch (Exception e1) {
                    JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                }


                giderEkleButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {

                        KurumGiderleriDAO giderDAO = null;
                        try {
                            giderDAO = new KurumGiderleriDAO();
                        } catch (Exception ex) {
                            throw new RuntimeException(ex);
                        }
                        AddGider dialog = new AddGider(Form1.this, giderDAO);
                        dialog.setVisible(true);

                    }
                });

                button4.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = GiderAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        List<KurumGiderleri> list = null;
                        List<AylikGider> list1 = null;
                        List<HaftalikGider> list2 = null;

                        try {
                            KurumGiderleriDAO kdao = new KurumGiderleriDAO();
                            String col = "";
                            System.out.println(giderCombo.getSelectedIndex());
                            switch (giderCombo.getSelectedIndex()) {
                                case 0:
                                    col = "gider_id";
                                    list = kdao.searchForGider(col, enteredText);
                                    break;
                                case 1:
                                    col = "gider";
                                    list = kdao.searchForGider(col, enteredText);
                                    break;
                                case 2:
                                    col = "tutar";
                                    list = kdao.searchForGider(col, enteredText);
                                    break;
                                case 3:
                                    col = "kurum_id";
                                    list = kdao.searchForGider(col, enteredText);
                                    break;
                                case 4:
                                    col = "tarih";
                                    list = kdao.searchForGider(col, enteredText);
                                    break;
                                case 5://haftalik gider dokumu
                                    list2 = kdao.getHaftalikDokum();
                                    break;
                                case 6://aylik gider dokumu
                                    list1 = kdao.getAylikDokum();
                                    break;
                                default:
                                    col = "gider";
                                    break;
                            }
                            System.out.println(col);
                            System.out.println(enteredText);
                            if (list != null) {

                                GiderTableModel model = new GiderTableModel(list);
                                table1.setModel(model);
                            } else if (list1 != null) {
                                AylikDokumTableModel model = new AylikDokumTableModel(list1);
                                table1.setModel(model);
                            } else if (list2 != null) {
                                HaftalikDokumTableModel model = new HaftalikDokumTableModel(list2);
                                table1.setModel(model);
                            }

                            //Make a table for list


                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
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
                        try {
                            switch (stokCombo.getSelectedIndex()) {
                                case 5:
                                    StokDAO sdao = new StokDAO();
                                    List<DersStok> list = sdao.getAllDersStok();
                                    DersStokTableModel model = new DersStokTableModel(list);
                                    table1.setModel(model);
                                    break;
                            }
                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                        }


                    }
                });

                button5.setVisible(!button5.isVisible());
                StokAtt.setVisible(!StokAtt.isVisible());
                stokLabel.setVisible(!stokLabel.isVisible());

                try {
                    StokDAO sdao = new StokDAO();
                    List<StokWithErr> list = sdao.getAllStokWithErr();
                    //Make a table for list
                    StokWithErrTableModel model = new StokWithErrTableModel(list);
                    table1.setModel(model);

                } catch (Exception e1) {
                    JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                }

                button5.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StokAtt.getText();
                        String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);

                        List<Stok> list = null;
                        List<DersStok> list1 = null;
                        List<StokWithErr> list2 = null;

                        try {
                            StokDAO sdao = new StokDAO();
                            String col = "";
                            System.out.println(stokCombo.getSelectedIndex());
                            switch (stokCombo.getSelectedIndex()) {
                                case 0:
                                    list2 = sdao.getAllStokWithErr();
                                    break;
                                case 1:
                                    col = "stok_id";
                                    list = sdao.searchForStok(col, enteredText);
                                    break;
                                case 2:
                                    col = "stok_türü";
                                    list = sdao.searchForStok(col, enteredText);
                                    break;
                                case 3:
                                    col = "miktar";
                                    list = sdao.searchForStok(col, enteredText);
                                    break;
                                case 4:
                                    col = "kurum_id";
                                    list = sdao.searchForStok(col, enteredText);
                                    break;
                                case 5:
                                    list1 = sdao.searchForDersStok(enteredText);
                                    break;
                                default:
                                    col = "stok_türü";
                                    list = sdao.searchForStok(col, enteredText);
                                    break;
                            }
                            //System.out.println(col);
                            //System.out.println(enteredText);
                            //List<Stok> list = sdao.searchForStok(col, enteredText);
                            //Make a table for list
                            if (list2 != null) {
                                StokWithErrTableModel model = new StokWithErrTableModel(list2);
                                table1.setModel(model);
                            } else if (list != null) {
                                StokTableModel model = new StokTableModel(list);
                                table1.setModel(model);
                            } else if (list1 != null) {
                                DersStokTableModel model = new DersStokTableModel(list1);
                                table1.setModel(model);
                            }


                        } catch (Exception e1) {
                            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
                        }
                    }
                });

            }
        });


        this.add(panel1);
        this.setVisible(true);

    }

    public void refreshDersView() {

        try {
            DersDAO ddao = new DersDAO();
            List<Ders> liste = ddao.getAllDers();
            //Make a table for list
            DersTableModel model = new DersTableModel(liste);
            table1.setModel(model);

        } catch (Exception e1) {
            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    {
// GUI initializer generated by IntelliJ IDEA GUI Designer
// >>> IMPORTANT!! <<<
// DO NOT EDIT OR ADD ANY CODE HERE!
        $$$setupUI$$$();
    }

    /**
     * Method generated by IntelliJ IDEA GUI Designer
     * >>> IMPORTANT!! <<<
     * DO NOT edit this method OR call it in your code!
     *
     * @noinspection ALL
     */
    private void $$$setupUI$$$() {
        panel1 = new JPanel();
        panel1.setLayout(new GridBagLayout());
        stuAtt = new JLabel();
        stuAtt.setText("Aradığınız Öğrenci Özelliğini Seçin:");
        GridBagConstraints gbc;
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 5;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stuAtt, gbc);
        dersAtt = new JLabel();
        dersAtt.setText("Aradığınız Ders Özelliğini Seçin:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 9;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(dersAtt, gbc);
        giderAtt = new JLabel();
        giderAtt.setText("Aradığınız Gider Özelliğini Seçin:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 13;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(giderAtt, gbc);
        stuCombo = new JComboBox();
        final DefaultComboBoxModel defaultComboBoxModel1 = new DefaultComboBoxModel();
        stuCombo.setModel(defaultComboBoxModel1);
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 5;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stuCombo, gbc);
        dersCombo = new JComboBox();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 9;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(dersCombo, gbc);
        giderCombo = new JComboBox();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 13;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(giderCombo, gbc);
        stokCombo = new JComboBox();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 17;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stokCombo, gbc);
        stokAtt = new JLabel();
        stokAtt.setText("Aradığınız Stok Özelliğini Seçin:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 17;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stokAtt, gbc);
        gelenBilgiLabel = new JLabel();
        gelenBilgiLabel.setHorizontalAlignment(10);
        gelenBilgiLabel.setText("");
        gbc = new GridBagConstraints();
        gbc.gridx = 7;
        gbc.gridy = 1;
        gbc.gridheight = 2;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.NORTHWEST;
        panel1.add(gelenBilgiLabel, gbc);
        persAtt = new JLabel();
        persAtt.setHorizontalAlignment(10);
        persAtt.setText("Aradığınız Personel Özelliğini Seçin:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 1;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(persAtt, gbc);
        persCombo = new JComboBox();
        final DefaultComboBoxModel defaultComboBoxModel2 = new DefaultComboBoxModel();
        persCombo.setModel(defaultComboBoxModel2);
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 1;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(persCombo, gbc);
        studentLabel = new JLabel();
        studentLabel.setText("Öğrenci Numarasını Giriniz:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 6;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(studentLabel, gbc);
        StudentAtt = new JTextField();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 6;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(StudentAtt, gbc);
        dersLabel = new JLabel();
        dersLabel.setText("Ders Kodunu Giriniz:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 10;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(dersLabel, gbc);
        DersAtt = new JTextField();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 10;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(DersAtt, gbc);
        öğrenciBilgisiButton = new JButton();
        öğrenciBilgisiButton.setText("Öğrenci Bilgisi");
        gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 5;
        gbc.gridheight = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(öğrenciBilgisiButton, gbc);
        dersBilgisiButton = new JButton();
        dersBilgisiButton.setText("Ders Bilgisi");
        gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 9;
        gbc.gridheight = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(dersBilgisiButton, gbc);
        giderLabel = new JLabel();
        giderLabel.setText("Gider Numarasını Giriniz:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 14;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(giderLabel, gbc);
        GiderAtt = new JTextField();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 14;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(GiderAtt, gbc);
        button4 = new JButton();
        button4.setText("Seç");
        gbc = new GridBagConstraints();
        gbc.gridx = 3;
        gbc.gridy = 15;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        panel1.add(button4, gbc);
        stokLabel = new JLabel();
        stokLabel.setText("Stok Numarasını Giriniz:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 18;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stokLabel, gbc);
        StokAtt = new JTextField();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 18;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(StokAtt, gbc);
        button5 = new JButton();
        button5.setText("Seç");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 19;
        gbc.gridwidth = 4;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        panel1.add(button5, gbc);
        giderBilgisiButton = new JButton();
        giderBilgisiButton.setText("Gider Bilgisi");
        gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 13;
        gbc.gridheight = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(giderBilgisiButton, gbc);
        stokBilgisiButton = new JButton();
        stokBilgisiButton.setText("Stok Bilgisi");
        gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 17;
        gbc.gridheight = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(stokBilgisiButton, gbc);
        personelLabel = new JLabel();
        personelLabel.setText("Personel Numarasını Giriniz:");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 2;
        gbc.gridwidth = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(personelLabel, gbc);
        PersonelAtt = new JTextField();
        gbc = new GridBagConstraints();
        gbc.gridx = 5;
        gbc.gridy = 2;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(PersonelAtt, gbc);
        button1 = new JButton();
        button1.setText("Seç");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 3;
        gbc.gridwidth = 4;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        panel1.add(button1, gbc);
        personelBilgisiButton = new JButton();
        personelBilgisiButton.setHideActionText(false);
        personelBilgisiButton.setText("Personel Bilgisi");
        gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridheight = 3;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.WEST;
        panel1.add(personelBilgisiButton, gbc);
        final JScrollPane scrollPane1 = new JScrollPane();
        gbc = new GridBagConstraints();
        gbc.gridx = 7;
        gbc.gridy = 3;
        gbc.gridheight = 18;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.fill = GridBagConstraints.BOTH;
        panel1.add(scrollPane1, gbc);
        table1 = new JTable();
        scrollPane1.setViewportView(table1);
        button2 = new JButton();
        button2.setText("Seç");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 7;
        gbc.gridwidth = 4;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        panel1.add(button2, gbc);
        button3 = new JButton();
        button3.setText("Seç");
        gbc = new GridBagConstraints();
        gbc.gridx = 4;
        gbc.gridy = 11;
        gbc.gridwidth = 2;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        panel1.add(button3, gbc);
        final JPanel spacer1 = new JPanel();
        gbc = new GridBagConstraints();
        gbc.gridx = 6;
        gbc.gridy = 0;
        gbc.fill = GridBagConstraints.VERTICAL;
        panel1.add(spacer1, gbc);
        dersEkleButton = new JButton();
        dersEkleButton.setText("Ders Ekle");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 11;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(dersEkleButton, gbc);
        giderEkleButton = new JButton();
        giderEkleButton.setText("Gider Ekle");
        gbc = new GridBagConstraints();
        gbc.gridx = 2;
        gbc.gridy = 15;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel1.add(giderEkleButton, gbc);
    }

    /**
     * @noinspection ALL
     */
    public JComponent $$$getRootComponent$$$() {
        return panel1;
    }

    public static class AddDers extends JDialog {
        private JPanel contentPane;
        private JButton buttonOK;
        private JButton buttonCancel;
        private JTextField DersAdiText;
        private JTextField DersKoduText;
        private JLabel dersAdiLabel;
        private JLabel dersKoduLabel;
        private DersDAO dersDAO;
        private Form1 form1;

        public AddDers(Form1 theform1, DersDAO thedersDAO) {
            this();
            form1 = theform1;
            dersDAO = thedersDAO;
        }

        public AddDers() {

            setContentPane(contentPane);
            setModal(true);
            getRootPane().setDefaultButton(buttonOK);

            this.setBounds(200, 100, 600, 400);

            buttonOK.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    saveDers();
                }
            });

            buttonCancel.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    onCancel();
                }
            });

            // call onCancel() when cross is clicked
            setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
            addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e) {
                    onCancel();
                }
            });

            // call onCancel() on ESCAPE
            contentPane.registerKeyboardAction(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    onCancel();
                }
            }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
        }

        protected void saveDers() {
            String dersAdi = DersKoduText.getText();
            String dersKodu = DersAdiText.getText();

            Ders tempDers = new Ders(dersKodu, dersAdi);

            try {
                dersDAO.addDers(tempDers);

                setVisible(false);
                dispose();

                form1.refreshDersView();

            } catch (Exception e1) {
                JOptionPane.showMessageDialog(form1, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

        private void onCancel() {
            dispose();
        }

        public static void main(String[] args) {
            AddDers dialog = new AddDers();
            dialog.pack();
            dialog.setVisible(true);
            System.exit(0);
        }

        {
// GUI initializer generated by IntelliJ IDEA GUI Designer
// >>> IMPORTANT!! <<<
// DO NOT EDIT OR ADD ANY CODE HERE!
            $$$setupUI$$$();
        }

        /**
         * Method generated by IntelliJ IDEA GUI Designer
         * >>> IMPORTANT!! <<<
         * DO NOT edit this method OR call it in your code!
         *
         * @noinspection ALL
         */
        private void $$$setupUI$$$() {
            contentPane = new JPanel();
            contentPane.setLayout(new GridBagLayout());
            final JPanel panel1 = new JPanel();
            panel1.setLayout(new GridBagLayout());
            GridBagConstraints gbc;
            gbc = new GridBagConstraints();
            gbc.gridx = 0;
            gbc.gridy = 1;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.fill = GridBagConstraints.BOTH;
            contentPane.add(panel1, gbc);
            final JPanel panel2 = new JPanel();
            panel2.setLayout(new GridBagLayout());
            gbc = new GridBagConstraints();
            gbc.gridx = 1;
            gbc.gridy = 0;
            gbc.weighty = 1.0;
            gbc.fill = GridBagConstraints.BOTH;
            panel1.add(panel2, gbc);
            buttonOK = new JButton();
            buttonOK.setText("Ekle");
            gbc = new GridBagConstraints();
            gbc.gridx = 0;
            gbc.gridy = 0;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            panel2.add(buttonOK, gbc);
            buttonCancel = new JButton();
            buttonCancel.setText("İptal");
            gbc = new GridBagConstraints();
            gbc.gridx = 1;
            gbc.gridy = 0;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            panel2.add(buttonCancel, gbc);
            final JPanel panel3 = new JPanel();
            panel3.setLayout(new GridBagLayout());
            gbc = new GridBagConstraints();
            gbc.gridx = 0;
            gbc.gridy = 0;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.fill = GridBagConstraints.BOTH;
            contentPane.add(panel3, gbc);
            dersAdiLabel = new JLabel();
            dersAdiLabel.setText("Ders Kodu");
            gbc = new GridBagConstraints();
            gbc.gridx = 0;
            gbc.gridy = 0;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.anchor = GridBagConstraints.WEST;
            panel3.add(dersAdiLabel, gbc);
            DersAdiText = new JTextField();
            gbc = new GridBagConstraints();
            gbc.gridx = 1;
            gbc.gridy = 0;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.anchor = GridBagConstraints.WEST;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            panel3.add(DersAdiText, gbc);
            dersKoduLabel = new JLabel();
            dersKoduLabel.setText("Ders Adı");
            gbc = new GridBagConstraints();
            gbc.gridx = 0;
            gbc.gridy = 1;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.anchor = GridBagConstraints.WEST;
            panel3.add(dersKoduLabel, gbc);
            DersKoduText = new JTextField();
            gbc = new GridBagConstraints();
            gbc.gridx = 1;
            gbc.gridy = 1;
            gbc.weightx = 1.0;
            gbc.weighty = 1.0;
            gbc.anchor = GridBagConstraints.WEST;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            panel3.add(DersKoduText, gbc);
        }

        /**
         * @noinspection ALL
         */
        public JComponent $$$getRootComponent$$$() {
            return contentPane;
        }
    }

    public void refreshGiderView() {
        try {
            KurumGiderleriDAO gdao = new KurumGiderleriDAO();
            List<KurumGiderleri> liste = gdao.getAllKurumGiderleri();
            //Make a table for list
            GiderTableModel model = new GiderTableModel(liste);
            table1.setModel(model);

        } catch (Exception e1) {
            JOptionPane.showMessageDialog(Form1.this, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }


    public class AddGider extends JDialog {
        private JPanel contentPane;
        private JButton buttonOK;
        private JButton buttonCancel;
        private JTextField giderNoText;
        private JTextField giderAdText;
        private JTextField giderTutarText;
        private JTextField giderKurumText;
        private JTextField giderTarihText;

        private KurumGiderleriDAO giderDAO;
        private Form1 form1;

        public AddGider(Form1 theform1, KurumGiderleriDAO thegiderDAO) {
            this();
            form1 = theform1;
            giderDAO = thegiderDAO;
        }

        public AddGider() {
            setContentPane(contentPane);
            setModal(true);
            getRootPane().setDefaultButton(buttonOK);

            this.setBounds(200, 100, 600, 400);

            buttonOK.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    saveGider();
                }
            });

            buttonCancel.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    onCancel();
                }
            });

            // call onCancel() when cross is clicked
            setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
            addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e) {
                    onCancel();
                }
            });

            // call onCancel() on ESCAPE
            contentPane.registerKeyboardAction(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    onCancel();
                }
            }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
        }

        protected void saveGider() {
            String giderId = giderNoText.getText();
            String gider = giderAdText.getText();
            String tutar = giderTutarText.getText();
            String kurumId = giderKurumText.getText();
            String tarih = giderTarihText.getText();

            KurumGiderleri tempGider = new KurumGiderleri(giderId, gider, tutar, kurumId, tarih);

            try {
                giderDAO.addGider(tempGider);

                setVisible(false);
                dispose();

                form1.refreshGiderView();

            } catch (Exception e1) {
                JOptionPane.showMessageDialog(form1, "Error:" + e1, "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

        private void onCancel() {
            // add your code here if necessary
            dispose();
        }

        public void main(String[] args) {
            AddGider dialog = new AddGider();
            dialog.pack();
            dialog.setVisible(true);
            System.exit(0);
        }

        {
// GUI initializer generated by IntelliJ IDEA GUI Designer
// >>> IMPORTANT!! <<<
// DO NOT EDIT OR ADD ANY CODE HERE!
            $$$setupUI$$$();
        }

        /**
         * Method generated by IntelliJ IDEA GUI Designer
         * >>> IMPORTANT!! <<<
         * DO NOT edit this method OR call it in your code!
         *
         * @noinspection ALL
         */
        private void $$$setupUI$$$() {
            contentPane = new JPanel();
            contentPane.setLayout(new com.intellij.uiDesigner.core.GridLayoutManager(6, 3, new Insets(10, 10, 10, 10), -1, -1));
            buttonCancel = new JButton();
            buttonCancel.setText("Cancel");
            contentPane.add(buttonCancel, new com.intellij.uiDesigner.core.GridConstraints(5, 2, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_CENTER, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_CAN_SHRINK | com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_CAN_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            buttonOK = new JButton();
            buttonOK.setText("Ekle");
            contentPane.add(buttonOK, new com.intellij.uiDesigner.core.GridConstraints(5, 1, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_CENTER, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_CAN_SHRINK | com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_CAN_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            final com.intellij.uiDesigner.core.Spacer spacer1 = new com.intellij.uiDesigner.core.Spacer();
            contentPane.add(spacer1, new com.intellij.uiDesigner.core.GridConstraints(5, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_CENTER, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
            final JLabel label1 = new JLabel();
            label1.setText("Gider Numarası");
            contentPane.add(label1, new com.intellij.uiDesigner.core.GridConstraints(0, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_NONE, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            final JLabel label2 = new JLabel();
            label2.setText("Gider Adı");
            contentPane.add(label2, new com.intellij.uiDesigner.core.GridConstraints(1, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_NONE, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            final JLabel label3 = new JLabel();
            label3.setText("Gider Tutarı");
            contentPane.add(label3, new com.intellij.uiDesigner.core.GridConstraints(2, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_NONE, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            final JLabel label4 = new JLabel();
            label4.setText("Kurum Numarası");
            contentPane.add(label4, new com.intellij.uiDesigner.core.GridConstraints(3, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_NONE, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            final JLabel label5 = new JLabel();
            label5.setText("Gider Tarihi");
            contentPane.add(label5, new com.intellij.uiDesigner.core.GridConstraints(4, 0, 1, 1, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_NONE, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
            giderNoText = new JTextField();
            contentPane.add(giderNoText, new com.intellij.uiDesigner.core.GridConstraints(0, 1, 1, 2, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
            giderAdText = new JTextField();
            contentPane.add(giderAdText, new com.intellij.uiDesigner.core.GridConstraints(1, 1, 1, 2, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
            giderTutarText = new JTextField();
            contentPane.add(giderTutarText, new com.intellij.uiDesigner.core.GridConstraints(2, 1, 1, 2, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
            giderKurumText = new JTextField();
            contentPane.add(giderKurumText, new com.intellij.uiDesigner.core.GridConstraints(3, 1, 1, 2, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
            giderTarihText = new JTextField();
            contentPane.add(giderTarihText, new com.intellij.uiDesigner.core.GridConstraints(4, 1, 1, 2, com.intellij.uiDesigner.core.GridConstraints.ANCHOR_WEST, com.intellij.uiDesigner.core.GridConstraints.FILL_HORIZONTAL, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_WANT_GROW, com.intellij.uiDesigner.core.GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
        }

        /**
         * @noinspection ALL
         */
        public JComponent $$$getRootComponent$$$() {
            return contentPane;
        }
    }
}
