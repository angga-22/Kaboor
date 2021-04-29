//
//  MateriModel.swift
//  KelistrikanBodyMotor
//
//  Created by Kelny Tan on 28/04/21.
//

import Foundation

struct MateriModel{
    let materiJudul: String?
    let materiDeskripsi: String?
    let materiImage: String?
    var materiToolsNames = [String]()
}

func getMateriModel() -> [MateriModel]{
    var materis = [MateriModel]()
    let materi1 = MateriModel(materiJudul: Judul.lampuNetral.rawValue, materiDeskripsi: "Lampu netral yaitu indikator yang menunjukkan gigi transmisi sedang pada posisi netral hal ini penting dimunculkan karena terkait dengan keamanan pengendara ketika akan memulai (stater) menghidupkan mesin kendaraan. Sehingga kendaraan tidak meloncat saat mesin akan dihidupkan.", materiImage: "lampuNetral", materiToolsNames: ["Aki", "Fuse", "Kunci Kontak", "Beban"])
    let materi2 = MateriModel(materiJudul: Judul.klakson.rawValue, materiDeskripsi: "Klakson berfungsi untuk memberi tanda/isyarat dengan bunyi. sedangkan bunyi itu timbul karena adanya getaran. agar klakson dapat didengar dengan baik dan sesuai dengan peraturan maka klakson harus mempunyai frekuensi getaran antara 1800 - 3550 Hz.", materiImage: "klakson", materiToolsNames: ["Aki", "Fuse", "Kunci Kontak", "Saklar Klakson", "Beban"])
    let materi3 = MateriModel(materiJudul: Judul.lampuRem.rawValue, materiDeskripsi: "Lampu rem pada kendaraan berfungsi sebagai tanda sinyal bagi pengendara lain yang berada dibelakangnya bahwa kendaraan sedang memperlambat laju kendaraan dan menghentikan laju kendaraan.", materiImage: "lampuRem", materiToolsNames: ["Aki", "Fuse", "Kunci Kontak", "Saklar Lampu Rem", "Beban"])
    let materi4 = MateriModel(materiJudul: Judul.lampuSein.rawValue, materiDeskripsi: "Fungsi lampu sein adalah untuk memberikan isyarat pada kendaraan yang ada di depan, belakang ataupun di sisinya bahwa sepeda motor tersebut akan berbelok ke kiri atau kanan atau pindah jalur. ", materiImage: "lampuSein", materiToolsNames: ["Aki", "Fuse", "Kunci Kontak", "Flasher", "Saklar Lampu Sein", "Beban"])
    let materi5 = MateriModel(materiJudul: Judul.lampuKepala.rawValue, materiDeskripsi: "Sistem lampu kepala terdiri dari lampu jauh dan lampu dekat, dimana lampu dekat digunakan sebagai penerangan jalan terutama pada malam hari sedangkan lampu jauh sering digunakan sebagai tanda pengganti klakson. lampu kepala terletak di depan kendaraan.", materiImage: "lampuKepala", materiToolsNames: ["Aki", "Fuse", "Kunci Kontak", "Saklar Utama", "Saklar Dim", "Beban"])
    materis.append(materi1)
    materis.append(materi2)
    materis.append(materi3)
    materis.append(materi4)
    materis.append(materi5)
    return materis
}

func getMateriByNama(nama: String) -> MateriModel{
    let materis = getMateriModel()
    var materiTerpilih: MateriModel?
    for (i) in materis.indices{
        if(materis[i].materiJudul == nama){
            materiTerpilih = materis[i]
            return materiTerpilih!
        }
    }
    return materiTerpilih!
}

enum Judul: String{
    case lampuNetral = "Lampu Netral"
    case klakson = "Klakson"
    case lampuRem = "Lampu Rem"
    case lampuSein = "Lampu Sein"
    case lampuKepala = "Lampu Kepala"
}
