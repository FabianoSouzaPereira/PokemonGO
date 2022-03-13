//
//  ViewController.swift
//  PokemonGO
//
//  Created by Fabiano De Souza Pereira on 13/03/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapa.delegate = self
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse && status != .notDetermined {
            //alerta
            let alertController = UIAlertController(title: "Permissão de localização", message: "Para que você possa caçar pokemons, precisamos da sua localização!! Por favor habilite", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações", style: .default, handler: {
                (alertConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertController.addAction(acaoConfiguracoes)
            alertController.addAction(acaoCancelar)
            
            present(alertController, animated: true, completion: nil)
            
        }
    }

}

