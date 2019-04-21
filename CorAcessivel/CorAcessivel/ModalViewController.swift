//
//  ModalViewController.swift
//  CorAcessivel
//
//  Created by Felipe Kaça Petersen on 19/04/19.
//  Copyright © 2019 Felipe Kaça Petersen. All rights reserved.
//

import UIKit

enum ViewType {
    case harmonizacao
    case daltonismo
}

class ModalViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var viewType: ViewType = .harmonizacao
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        dissmissTap()
        setupText()
        // Do any additional setup after loading the view.
    }
    
    func setupText() {
        switch viewType {
        case .harmonizacao:
            self.descLabel.text = " Uma roda de cores, ou círculo cromático, permite uma melhor análise da combinação de tons, e, consequentemente, garante uma harmonia entre elas.  Existem vários tipos de harmonia, tal que os mais comuns são:  Complementar, Monocromático, Análogo, Triádico e Tetrádico.\n- Complementar: É a harmonia que ocorre quando combinamos cores opostas na roda das cores.\n- Monocromático: É a harmonia resultante de uma mesma cor da roda das cores.\n- Análogo: é formado de uma cor primária combinada com duas cores vizinhas na roda das cores.\n- Triádico: É a harmonia onde usamos três cores equidistantes no circulo cromático.\n- Tetrádico: harmonias com dois pares de cores complementares."
            self.titleLabel.text = "Harmonização"
        default:
            self.descLabel.text = "O daltonismo é um tipo de deficiência visual em que o indivíduo não é capaz de reconhecer e diferenciar algumas cores específicas. Existem três tipos principais de daltonismo: Protanopia, Deuteranopia e Tritanopia.\n -Protanopia: é o mais comum de todos e é caracterizado, principalmente, pela diminuição ou ausência total do pigmento vermelho.\n -Deuteranopia: não é capaz de distinguir a cor verde. Mas, da mesma forma que ocorre com a protanopia, os tons vistos geralmente são puxados para o marrom. \n -Tritanopia: é o tipo mais raro de daltonismo. Ela interfere na distinção e reconhecimento das cores azul e amarelo."
            self.titleLabel.text = "Daltonismo"
        }
    }
    
    func dissmissTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissView))
        self.backView.addGestureRecognizer(tap)
    }
    
    @objc func dissmissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
