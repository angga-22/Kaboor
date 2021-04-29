//
//  ToolModel.swift
//  KelistrikanBodyMotor
//
//  Created by Kelny Tan on 28/04/21.
//

import Foundation

struct ToolModel{
    var toolName: String?
    var toolDescription: String?
    var toolImage: String?
}

func getToolModel() -> [ToolModel]
{
    var toolModels = [ToolModel]()
    let tool1 = ToolModel(toolName: "Aki", toolDescription: "Akumulator (accu, aki) adalah sebuah alat yang dapat menyimpan energi (umumnya energi listrik) dalam bentuk energi kimia. Contoh-contoh akumulator adalah baterai dan kapasitor. di dalam standar internasional setiap satu cell akumulator memiliki tegangan sebesar 2 volt. sehingga aki 12 volt, memiliki 6 cell sedangkan aki 24 volt memiliki 12 cell.", toolImage: toolPicNames.aki.rawValue)
    let tool2 = ToolModel(toolName: "Fuse", toolDescription: "Fuse atau sekering merupakan salah satu komponen elektronika yang sering dipakai pada kendaraan yang berfungsi untuk memutuskan hubungan ketika terjadi hubungan singkat atau dapat disebabkan karena kelebihan arus yang mengalir atau beban lainnya sehingga arus listrik tidak akan mengalir.", toolImage: toolPicNames.fuse.rawValue)
    let tool3 = ToolModel(toolName: "Kunci Kontak", toolDescription: "Kunci kontak merupakan rangkaian dari sistem penguncian di motor kunci kontak berfungsi untuk menghubungkan dan memutuskan listrik yang ada dalam rangkaian. Selain itu bisa juga untuk menghidupkan dan mematikan sistem.", toolImage: toolPicNames.kunciKontak.rawValue)
    let tool4 = ToolModel(toolName: "Beban", toolDescription: "Beban merupakan komponen utama untuk mengubah energi listrik menjadi energi yang diinginkan. Misal pada lampu menjadi cahaya, dan pada klakson menjadi suara.", toolImage: toolPicNames.beban.rawValue)
    let tool5 = ToolModel(toolName: "Saklar Klakson", toolDescription: "Saklar adalah alat input untuk mengaktifkan atau menonaktifkan suatu sistem kelistrikan. Pada kelistrikan body, hampir semua sistem ada saklarnya. umumnya sistem klakson menggunakan tipe saklar tekan, yaitu ketika saklar ditekan pada terjadi hubungan antara terminal klakson satu dengan yang lainnya.", toolImage: toolPicNames.saklarKlakson.rawValue)
    let tool6 = ToolModel(toolName: "Saklar Lampu Rem", toolDescription: "Saklar lampu rem berfungsi untuk menghubungkan arus dari baterai ke lampu rem jika tuas/handel rem ditarik. Dengan menarik tuas rem tersebut, maka sistem rem akan bekerja.", toolImage: toolPicNames.saklarLampuRem.rawValue)
    let tool7 = ToolModel(toolName: "Flasher", toolDescription: "Flasher lampu sein merupakan suatu alat yang menyebabkan lampu sein mengedip secara interval/jarak waktu tertentu yaitu antara 60 dan 120 kali setiap menitnya. Terdapat beberapa tipe flasher, diantaranya flasher dengan kapasitor, flasher dengan bimetal, dan flasher dengan transistor.", toolImage: toolPicNames.flasher.rawValue)
    let tool8 = ToolModel(toolName: "Saklar Lampu Sein", toolDescription: "Saklar lampu tanda belok berfungsi untuk menghidupkan dan mematikan arah posisi lampu sein. Selain itu juga untuk menghubungkan flasher dengan lampu dan sumber tegangan dari baterai. Biasanya saklar lampu tanda belok memiliki enam kaki (soket), 2 ke lampu, 2 ke flasher, dan sisanya ke sumber tegangan. ", toolImage: toolPicNames.saklarLampuSein.rawValue)
    let tool9 = ToolModel(toolName: "Saklar Utama", toolDescription: "Saklar ini memiliki tujuan untuk menyambungkan tenaga yang berasal dari baterai atau alternator ke rangkaian sistem kelistrikan lampu kepala. Selain untuk lampu kepala saklar utama juga berfungsi untuk menyalakan lampu kota.", toolImage: toolPicNames.saklarUtamaDim.rawValue)
    let tool10 = ToolModel(toolName: "Saklar Dim", toolDescription: "Saklar pembagi atau saklar dim fungsinya untuk memindahkan lampu kepala dekat ke jauh atau sebaliknya. Kebanyakan untuk di motor saklar dim bekerja dengan cara ditekan.", toolImage: toolPicNames.saklarUtamaDim.rawValue)
    toolModels.append(tool1)
    toolModels.append(tool2)
    toolModels.append(tool3)
    toolModels.append(tool4)
    toolModels.append(tool5)
    toolModels.append(tool6)
    toolModels.append(tool7)
    toolModels.append(tool8)
    toolModels.append(tool9)
    toolModels.append(tool10)
    return toolModels
}

func getToolByNama(nama: String) -> ToolModel{
    var toolTerpilih: ToolModel?
    let tools = getToolModel()
    for(i) in tools.indices{
        if(tools[i].toolName == nama){
            toolTerpilih = tools[i]
            return toolTerpilih!
        }
    }
    return toolTerpilih!
}

enum toolPicNames: String{
    case aki = "aki"
    case fuse = "fuse"
    case kunciKontak = "kunciKontak"
    case beban = "beban"
    case saklarKlakson = "saklarKlakson"
    case saklarLampuRem = "saklarLampuRem"
    case flasher = "flasher"
    case saklarLampuSein = "saklarLampuSein"
    case saklarUtamaDim = "saklarUtamaDim"
}
