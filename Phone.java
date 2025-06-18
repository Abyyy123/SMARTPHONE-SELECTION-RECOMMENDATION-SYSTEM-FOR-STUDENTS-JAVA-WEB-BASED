/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package recommendation;

/**
 *
 * @author hp
 */
public class Phone {
    private String Merk;
    private double Harga;
    private double Ram;
    private double MemoryInternal;
    private double Kamera;
    private double Baterai;
    private double normalizedPrice;
    private double normalizedRam;
    private double normalizedMemory;
    private double normalizedCamera;
    private double normalizedBattery;
    private double score;

    public Phone(String Merk, double Harga, double Ram, double MemoryInternal, double Kamera, double Baterai) {
        this.Merk = Merk;
        this.Harga = Harga;
        this.Ram = Ram;
        this.MemoryInternal = MemoryInternal;
        this.Kamera = Kamera;
        this.Baterai = Baterai;
    }

    // Getters and setters for all fields
    public String getMerk() {
        return Merk;
    }

    public double getHarga() {
        return Harga;
    }

    public double getRam() {
        return Ram;
    }

    public double getMemoryInternal() {
        return MemoryInternal;
    }

    public double getKamera() {
        return Kamera;
    }

    public double getBaterai() {
        return Baterai;
    }

    public double getNormalizedPrice() {
        return normalizedPrice;
    }

    public void setNormalizedPrice(double normalizedPrice) {
        this.normalizedPrice = normalizedPrice;
    }

    public double getNormalizedRam() {
        return normalizedRam;
    }

    public void setNormalizedRam(double normalizedRam) {
        this.normalizedRam = normalizedRam;
    }
    
    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
