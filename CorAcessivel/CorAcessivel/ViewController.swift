//
//  ViewController.swift
//  CorAcessivel
//
//  Created by Felipe Kaça Petersen on 17/04/19.
//  Copyright © 2019 Felipe Kaça Petersen. All rights reserved.
//

import UIKit

enum EstadoView {
    case selecionarImagem
    case selecionarHarmonizacao
    case selecionouHarmonizacao
    case selecionouDaltonismo
}

class ViewController: UIViewController {
    
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var corMediaStackView: UIStackView!
    @IBOutlet weak var corMediaView: ColorView!
    @IBOutlet weak var harmonizacaoStackView: UIStackView!
    @IBOutlet weak var harmonizacaoTextField: UITextField!
    @IBOutlet weak var corHarmonizacaoStackView: UIStackView!
    @IBOutlet weak var corHarmonizacao1View: ColorView!
    @IBOutlet weak var corHarmonizacao2View: ColorView!
    @IBOutlet weak var corHarmonizacao3View: ColorView!
    @IBOutlet weak var daltonismoStackView: UIStackView!
    @IBOutlet weak var daltonismoTextField: UITextField!
    @IBOutlet weak var corDaltonicoStackView: UIStackView!
    @IBOutlet weak var corDaltonico1View: ColorView!
    @IBOutlet weak var corDaltonico2View: ColorView!
    @IBOutlet weak var corDaltonico3View: ColorView!

    let pickerView = UIPickerView()
    let tiposHarmonizacao = ["Complementar", "Monocromático", "Análogo", "Triádico", "Tetrádico"]
    let tiposDaltonismo = ["Deuteranopia", "Protanopia", "Tritanopia"]
    
    var estado: EstadoView = .selecionarImagem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        self.imageTap()
        setupTextField()
        setupPickerView()
        setupViewTap()
        setupImage()
    }
    
    func updateView() {
        switch estado {
        case .selecionarImagem:
            self.corMediaStackView.isHidden = true
            self.harmonizacaoStackView.isHidden = true
            self.corHarmonizacaoStackView.isHidden = true
            self.daltonismoStackView.isHidden = true
            self.corDaltonicoStackView.isHidden = true
            
        case .selecionarHarmonizacao:
            self.corMediaStackView.isHidden = false
            self.harmonizacaoStackView.isHidden = false
            
        case .selecionouHarmonizacao:
            self.corHarmonizacaoStackView.isHidden = false
            self.daltonismoStackView.isHidden = false
            
        case .selecionouDaltonismo:
            self.corDaltonicoStackView.isHidden = false
        }
    }
    
    func imageTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        self.selectImageView.addGestureRecognizer(tap)
    }
    
    func setupViewTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissPicker))
        self.view.addGestureRecognizer(tap)
    }
    
    func setupImage() {
        self.selectImageView.layer.cornerRadius = 8
    }
    
    @objc func didTapImage() {
        ImagePickerManager().pickImage(self){ foto in
            self.selectImageView.image = foto
            self.estado = .selecionarHarmonizacao
            self.updateView()
        }
    }
    
    @objc func dissmissPicker() {
        self.harmonizacaoTextField.endEditing(true)
        self.daltonismoTextField.endEditing(true)
    }
    
    func setupTextField() {
        harmonizacaoTextField.inputView = pickerView
        daltonismoTextField.inputView = pickerView
    }
    
    func setupPickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if harmonizacaoTextField.isFirstResponder {
            return tiposHarmonizacao.count
        } else {
            return tiposDaltonismo.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if harmonizacaoTextField.isFirstResponder {
            return tiposHarmonizacao[row]
        } else {
            return tiposDaltonismo[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if harmonizacaoTextField.isFirstResponder {
            self.harmonizacaoTextField.text = tiposHarmonizacao[row]
            estado = .selecionouHarmonizacao
        } else {
            self.daltonismoTextField.text = tiposDaltonismo[row]
            estado = .selecionouDaltonismo
        }
        self.updateView()
        self.harmonizacaoTextField.endEditing(true)
        self.daltonismoTextField.endEditing(true)
    }
}
