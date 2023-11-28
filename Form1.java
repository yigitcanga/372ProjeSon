import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

    public Form1() {

        add(panel1);
        this.setTitle("Bilgi Uygulaması");
        this.setSize(400, 300);
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
        persAttButton.setVisible(false);
        stuAttButton.setVisible(false);
        dersAttButton.setVisible(false);
        giderAttButton.setVisible(false);
        stokAttButton.setVisible(false);

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

            persAtt.setVisible(!persAtt.isVisible());
            persAttButton.setVisible(!persAttButton.isVisible());
            persCombo.setVisible(!persCombo.isVisible());

            persAttButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {

                    String selectedOption = persCombo.getSelectedItem().toString();
                    String yeniBilgi = selectedOption + " giriniz.";
                    personelLabel.setText(yeniBilgi);

                    button1.setVisible(!button1.isVisible());
                    PersonelAtt.setVisible(!PersonelAtt.isVisible());
                    personelLabel.setVisible(!personelLabel.isVisible());

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
            }
        });

        öğrenciBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                stuAtt.setVisible(!stuAtt.isVisible());
                stuAttButton.setVisible(!stuAttButton.isVisible());
                stuCombo.setVisible(!stuCombo.isVisible());

                stuAttButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {

                        String selectedOption = stuCombo.getSelectedItem().toString();
                        String yeniBilgi = selectedOption + " giriniz.";
                        studentLabel.setText(yeniBilgi);

                        button2.setVisible(!button2.isVisible());
                        StudentAtt.setVisible(!StudentAtt.isVisible());
                        studentLabel.setVisible(!studentLabel.isVisible());

                        button2.addActionListener(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                String enteredText = StudentAtt.getText();
                                String yeniBilgi = enteredText + " için veritabanı bilgisi burada!";
                                gelenBilgiLabel.setText(yeniBilgi);
                            }
                        });

                    }
                });
            }
        });

        dersBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                dersAtt.setVisible(!dersAtt.isVisible());
                dersAttButton.setVisible(!dersAttButton.isVisible());
                dersCombo.setVisible(!dersCombo.isVisible());

                dersAttButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {

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
            }
        });

        giderBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                giderAtt.setVisible(!giderAtt.isVisible());
                giderAttButton.setVisible(!giderAttButton.isVisible());
                giderCombo.setVisible(!giderCombo.isVisible());

                giderAttButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {

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
            }
        });

        stokBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                stokAtt.setVisible(!stokAtt.isVisible());
                stokAttButton.setVisible(!stokAttButton.isVisible());
                stokCombo.setVisible(!stokCombo.isVisible());

                stokAttButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {

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
            }
        });


        this.add(panel1);
        this.setVisible(true);

    }

    private void createUIComponents() {
        gelenBilgiLabel = new JLabel();
    }

}
