package org.proje.gui;

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
    private JTextField PersonelNo;
    private JButton button1;
    private JButton button2;
    private JButton button3;
    private JButton button4;
    private JButton button5;
    private JTextField ÖğrenciNo;
    private JTextField DersNo;
    private JTextField GiderNo;
    private JTextField StokNo;
    private JLabel personelLabel;
    private JLabel studentLabel;
    private JLabel dersLabel;
    private JLabel giderLabel;
    private JLabel stokLabel;

    public Form1() {
        // JFrame ve diğer bileşenleri oluşturun
        add(panel1);
        this.setTitle("Bilgi Uygulaması");
        this.setSize(400, 300);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        button1.setVisible(false);
        button2.setVisible(false);
        button3.setVisible(false);
        button4.setVisible(false);
        button5.setVisible(false);
        ÖğrenciNo.setVisible(false);
        PersonelNo.setVisible(false);
        DersNo.setVisible(false);
        GiderNo.setVisible(false);
        StokNo.setVisible(false);
        personelLabel.setVisible(false);
        studentLabel.setVisible(false);
        dersLabel.setVisible(false);
        giderLabel.setVisible(false);
        stokLabel.setVisible(false);


        personelBilgisiButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {

            button1.setVisible(!button1.isVisible());
            PersonelNo.setVisible(!PersonelNo.isVisible());
            personelLabel.setVisible(!personelLabel.isVisible());

            button1.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    String enteredText = PersonelNo.getText();
                    String yeniBilgi = enteredText + " numaralı personel bilgisi burada!";
                    gelenBilgiLabel.setText(yeniBilgi);
                }
                });


            }
        });


        öğrenciBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                button2.setVisible(!button2.isVisible());
                ÖğrenciNo.setVisible(!ÖğrenciNo.isVisible());
                studentLabel.setVisible(!studentLabel.isVisible());

                button2.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = ÖğrenciNo.getText();
                        String yeniBilgi = enteredText + " numaralı öğrenci bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });


            }
        });

        dersBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                button3.setVisible(!button3.isVisible());
                DersNo.setVisible(!DersNo.isVisible());
                dersLabel.setVisible(!dersLabel.isVisible());

                button3.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = DersNo.getText();
                        String yeniBilgi = enteredText + " numaralı ders bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });

            }
        });

        giderBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                button4.setVisible(!button4.isVisible());
                GiderNo.setVisible(!GiderNo.isVisible());
                giderLabel.setVisible(!giderLabel.isVisible());

                button4.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = GiderNo.getText();
                        String yeniBilgi = enteredText + " numaralı gider bilgisi burada!";
                        gelenBilgiLabel.setText(yeniBilgi);
                    }
                });
            }
        });

        stokBilgisiButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                button5.setVisible(!button5.isVisible());
                StokNo.setVisible(!StokNo.isVisible());
                stokLabel.setVisible(!stokLabel.isVisible());

                button5.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String enteredText = StokNo.getText();
                        String yeniBilgi = enteredText + " numaralı stok bilgisi burada!";
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
