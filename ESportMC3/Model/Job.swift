//
//  Job.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 22/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct Job {
    var name: String
    var salary: String
    var role: String
    var gender: String
    var image : String?
    var requirement : String?
    var contactPerson : String?
    var description : String?
    
    
    init(name : String, salary : String, role : String, gender : String) {
        self.name = name
        self.salary = salary
        self.role = role
        self.gender = gender
    }
    
    init(name : String, salary : String, role : String, gender : String, image : String, contactPerson : String, requirement : String, description : String) {
        self.name = name
        self.salary = salary
        self.role = role
        self.gender = gender
        self.image = image
        self.contactPerson = contactPerson
        self.requirement = requirement
        self.description = description
    }
    
    static func getJobs() -> [Job] {
        return [
            Job(name: "Dota 2 Championship 2019", salary: "Rp.5.000.000 - Rp.10.000.000", role: "All Roles", gender: "Male", image: "logo1", contactPerson: "Email : dota2champ@gmail.com \nPhone : 08121829102", requirement: "1. Umur 18-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.5 kali \n4. Pernah menjuarai turnamen min. tingat regional min.3 kali", description: "Turnamen Dota 2, berkesempatan untuk memenangkan hadiah senilai up to 10 jt, daftarkan tim kalian segera dengan minimal tim 4 orang, turnamen akan diadakan diakhir tahun 2019."),
             Job(name: "Dota 2 Tournament 2019", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Hard Support", gender: "Male", image: "logo2", contactPerson: "Email : hrd-recruitment@gmail.com \nPhone : 08154832112", requirement: "1. Umur 18-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.1 kali \n4. Pernah menjuarai turnamen min. tingat nasional min.1 kali", description: "Turnamen Dota 2, berkesempatan untuk memenangkan hadiah senilai up to 5 jt, daftarkan tim kalian segera dengan minimal tim 4 orang."),
             Job(name: "Dota 2 Championship League", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Offlaner", gender: "Male", image: "logo1", contactPerson: "Call/WA : 08121829102", requirement: "1. Umur 18-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.1 kali \n4. Pernah menjuarai turnamen min. tingat regional min.1 kali", description: "Turnamen Dota 2,dibutuhkan pemain dengan skill utama sebagai offlaner, bisa berkomunikasi dan beradaptasi dengan cepat terhadap anggota tim lainnya, jika berimat silahkan daftarkan diri anda."),
             Job(name: "Dota 2 Indonesia Professional", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Solo Mid", gender: "Female", image: "logo1", contactPerson: "WA/Call : 08121829102", requirement: "1. Umur 15-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.1 kali \n4. Pernah menjuarai turnamen min. tingat regional min.2 kali", description: "Dibutuhkan satu anggota untuk mengisi posisi Solo Mid, bisa berkomunikasi dengan baik dan cepat beradaptasi dengan anggota kelompok baru, daftarkan diri anda sekarang."),
            Job(name: "NXL new recruitment member team", salary: "Rp.3.500.000 - Rp.4.000.000", role: "Roaming Support", gender: "All Gender", image: "logo2", contactPerson: "Email : hrd-recruitment@gmail.com \nPhone : 08121829102", requirement: "1. Umur 18-25 \n2. WNI \n3. Memiliki background dan experience dalam bermain dota kurang lebih 2 tahun \n4.Sudah sering mengikuti turnamen sekelas internasional dan nasional \n5. Bersedia untuk tinggal didalam game house (mon-fri) \n6. bersedia untuk bermain selama 6 jam sehari dan mengikuti berbagai macam training", description: "Open recruitment NXL member team, NXL membuka perekrutan untuk bergabung bersama kedalam atlet e-sport dota 2, diberikan gear perlengkapan untuk mendukung pemain serta diberikan allowance serta berbagai macam kebutuhan lainnya"),
            Job(name: "Open Recruitment for Dota 2 Championship", salary: "Rp.1.500.000", role: "Solo Mid", gender: "Female", image: "logo1", contactPerson: "Email : hrd-recruitment@gmail.com \nPhone : 08121829102", requirement: "1. Umur 18-25 \n2. WNI \n3. Memiliki background dan experience dalam bermain dota kurang lebih 2 tahun \n4.Sudah sering mengikuti turnamen sekelas internasional dan nasional \n5. Bersedia untuk tinggal didalam game house (mon-fri) \n6. bersedia untuk bermain selama 6 jam sehari dan mengikuti berbagai macam training", description: "Open recruitment NXL member team, NXL membuka perekrutan untuk bergabung bersama kedalam atlet e-sport dota 2, diberikan gear perlengkapan untuk mendukung pemain serta diberikan allowance serta berbagai macam kebutuhan lainnya"),
            Job(name: "3 months internship in Evos", salary: "Rp.1.200.000", role: "Player", gender: "Male", image: "logo1", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya selama 3 bulan mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport dengan sistem internship, selama 3 bulan penuh dilatih dan dipersiapkan untuk mengikuti turnamen bertingkat nasional."),
            Job(name: "Finding a Dota player for 2 month", salary: "Rp.1.000.000", role: "Player", gender: "Male", image: "logo2", contactPerson: "Email : hrd-recruitment@gmail.com \nPhone : 08154832112", requirement: "1. Umur 18-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.1 kali \n4. Pernah menjuarai turnamen min. tingat nasional min.1 kali", description: "Turnamen Dota 2, berkesempatan untuk memenangkan hadiah senilai up to 5 jt, daftarkan tim kalian segera dengan minimal tim 4 orang."),
            Job(name: "Dota 2 Championship League", salary: "Rp.3.000.000 - Rp.5.000.000", role: "Offlaner", gender: "All Gender", image: "logo0", contactPerson: "Email : hrd-recruitment@gmail.com \nPhone : 08154832112", requirement: "1. Umur 18-25 \n2. WNI \n3. Pernah mengikuti turnamen internasional min.1 kali \n4. Pernah menjuarai turnamen min. tingat nasional min.1 kali", description: "Turnamen Dota 2, berkesempatan untuk memenangkan hadiah senilai up to 5 jt, daftarkan tim kalian segera dengan minimal tim 4 orang."),
            Job(name: "Open Recruitment member for NEMESYS CUP", salary: "Rp.5.000.000", role: "Player", gender: "Male", image: "logo1", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport untuk satu orang terpilih, jika terpilih anda akan mendapat gaji bulanan serta diberikan fasilitas gaming house untuk menunjnag kegiatan bermain."),
            Job(name: "Professional player needed (Meister Division Turney)", salary: "Rp.3.000.000", role: "Player", gender: "All Gender", image: "logo1", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport untuk satu orang terpilih, jika terpilih anda akan mendapat gaji bulanan serta diberikan fasilitas gaming house untuk menunjnag kegiatan bermain."),
            Job(name: "Open Recruitment for 2 member (BahteraTV Rookie)", salary: "Rp.2.000.000", role: "Player", gender: "All Gender", image: "logo0", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport untuk dua orang terpilih, jika terpilih anda akan mendapat gaji bulanan serta diberikan fasilitas gaming house untuk menunjnag kegiatan bermain."),
            Job(name: "Seventh Heaven Turney (Find 2 pro players)", salary: "Rp.5.000.000", role: "Player", gender: "All Gender", image: "logo2", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport untuk dua orang terpilih, jika terpilih anda akan mendapat gaji bulanan serta diberikan fasilitas gaming house untuk menunjnag kegiatan bermain."),
            Job(name: "GIGA ESPORT GARUDA (Finding 1 pro player)", salary: "Pool Prize Rp 23jt", role: "Solo Mid", gender: "Female", image: "logo", contactPerson: "Call/WA : 0811105263", requirement: "1. Bersedia untuk meluangkan waktunya mulai dari jam 2-8 malam (des-mar) \n2. Bersedia datang ke game house yang telah disediakan \n3. Pernah juara turnamen dota 2 setingkat nasional", description: "Dibuka rekrutmen untuk menjadi atlet e-sport untuk satu orang terpilih, jika terpilih anda akan mendapat gaji bulanan serta diberikan fasilitas gaming house untuk menunjnag kegiatan bermain."),
            
        ]
    }
}

protocol JobListener {
    func didTap(job : Job)
}
