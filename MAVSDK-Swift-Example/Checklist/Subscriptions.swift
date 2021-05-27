//
//  Subscriptions.swift
//  MAVSDK_Swift_Example
//
//  Created by Douglas Silva on 27/05/21.
//

import RxSwift
import Mavsdk

class Subscriptions {
    var disposeBag = DisposeBag()
    
    init() {
        addObservers()
    }
    
    // MARK: - Add Observers
    func addObservers() {
        coreObservers()
        telemetryObservers()
        infoObservers()
        cameraObservers()
    }
    
    // Core
    func coreObservers() {
        connectionState()
    }
    
    // Telemetry
    func telemetryObservers() {
        health()
        position()
        attitudeEuler()
        home()
        cameraAttitudeEuler()
        gpsInfo()
        rcStatus()
        armed()
        statusText()
        positionVelocityNed()
        flightMode()
        battery()
    }
    
    // Info
    func infoObservers() {
        getIdentification()
        getProduct()
        getFlightInformation()
        getVersion()
    }
    
    // Camera
    func cameraObservers() {
        information()
        videoStreamInfo()
        mode()
        captureInfo()
        currentSettings()
        possibleSettingOptions()
        status()
    }
    
    // Mission
    func missionObservers() {
        missionProgress()
    }
}

// MARK: - Core Observers
extension Subscriptions {
    func connectionState() {
        drone!.core.connectionState
            .distinctUntilChanged()
            .subscribe(onNext: { (connectionState) in
                print("+DC+ core connectionState: \(connectionState.isConnected)")
            }, onError: { error in
                print("+DC+ core connectionState error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Telemetry Observers
extension Subscriptions {
    func health() {
        drone!.telemetry.health
            .subscribe(onNext: { health in
                print("+DC+ telemetry health: \(health)")
            }, onError: { error in
                print("+DC+ telemetry health error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func position() {
        drone!.telemetry.position
            .subscribe(onNext: { position in
                print("+DC+ telemetry position: \(position)")
            }, onError: { error in
                print("+DC+ telemetry position error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func attitudeEuler() {
        drone!.telemetry.attitudeEuler
            .subscribe(onNext: { attitudeEuler in
                print("+DC+ telemetry attitudeEuler: \(attitudeEuler)")
            }, onError: { error in
                print("+DC+ telemetry attitudeEuler error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func home() {
        drone!.telemetry.home
            .subscribe(onNext: { home in
                print("+DC+ telemetry home: \(home)")
            }, onError: { error in
                print("+DC+ telemetry home error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func cameraAttitudeEuler() {
        drone!.telemetry.cameraAttitudeEuler
            .subscribe(onNext: { cameraAttitudeEuler in
                print("+DC+ telemetry cameraAttitudeEuler: \(cameraAttitudeEuler)")
            }, onError: { error in
                print("+DC+ telemetry cameraAttitudeEuler error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func gpsInfo() {
        drone!.telemetry.gpsInfo
            .subscribe(onNext: { gpsInfo in
                print("+DC+ telemetry gpsInfo: \(gpsInfo)")
            }, onError: { error in
                print("+DC+ telemetry gpsInfo error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func rcStatus() {
        drone!.telemetry.rcStatus
            .subscribe(onNext: { rcStatus in
                print("+DC+ telemetry rcStatus: \(rcStatus)")
            }, onError: { error in
                print("+DC+ telemetry rcStatus error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func armed() {
        drone!.telemetry.armed
            .subscribe(onNext: { armed in
                print("+DC+ telemetry armed: \(armed)")
            }, onError: { error in
                print("+DC+ telemetry armed error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func statusText() {
        drone!.telemetry.statusText
            .subscribe(onNext: { statusText in
                print("+DC+ telemetry statusText: \(statusText)")
            }, onError: { error in
                print("+DC+ telemetry statusText error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func positionVelocityNed() {
        drone!.telemetry.positionVelocityNed
            .subscribe(onNext: { positionVelocityNed in
                print("+DC+ telemetry positionVelocityNed: \(positionVelocityNed)")
            }, onError: { error in
                print("+DC+ telemetry positionVelocityNed error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func flightMode() {
        drone!.telemetry.flightMode
            .subscribe(onNext: { value in
                print("+DC+ telemetry flightMode: \(value)")
            }, onError: { error in
                print("+DC+ telemetry flightMode error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func battery() {
        drone!.telemetry.battery
            .subscribe(onNext: { value in
                print("+DC+ telemetry battery: \(value)")
            }, onError: { error in
                print("+DC+ telemetry battery error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Info Observers
extension Subscriptions {
    func getIdentification() {
        drone!.info.getIdentification()
            .subscribe(onSuccess: { value in
                print("+DC+ info getIdentification: \(value)")
            }, onError: { (error) in
                print("+DC+ info getIdentification error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func getProduct() {
        drone!.info.getProduct()
            .subscribe(onSuccess: { value in
                print("+DC+ info getProduct: \(value)")
            }, onError: { (error) in
                print("+DC+ info getProduct error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func getFlightInformation() {
        drone!.info.getFlightInformation()
            .subscribe(onSuccess: { value in
                print("+DC+ info getFlightInformation: \(value)")
            }, onError: { (error) in
                print("+DC+ info getFlightInformation error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func getVersion() {
        drone!.info.getVersion()
            .subscribe(onSuccess: { value in
                print("+DC+ info getVersion: \(value)")
            }, onError: { (error) in
                print("+DC+ info getVersion error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
}


// MARK: - Camera
extension Subscriptions {
    // Observers
    func information() {
        drone!.camera.information
            .subscribe(onNext: { value in
                print("+DC+ camera information: \(value)")
            }, onError: { error in
                print("+DC+ camera information error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func videoStreamInfo() {
        drone!.camera.videoStreamInfo
            .subscribe(onNext: { value in
                print("+DC+ camera videoStreamInfo: \(value)")
            }, onError: { error in
                print("+DC+ camera videoStreamInfo error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func mode() {
        drone!.camera.mode
            .subscribe(onNext: { value in
                print("+DC+ camera mode: \(value)")
            }, onError: { error in
                print("+DC+ camera mode error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func captureInfo() {
        drone!.camera.captureInfo
            .subscribe(onNext: { value in
                print("+DC+ camera captureInfo: \(value)")
            }, onError: { error in
                print("+DC+ camera captureInfo error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func currentSettings() {
        drone!.camera.currentSettings
            .subscribe(onNext: { value in
                print("+DC+ camera currentSettings: \(value)")
            }, onError: { error in
                print("+DC+ camera currentSettings error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func possibleSettingOptions() {
        drone!.camera.possibleSettingOptions
            .subscribe(onNext: { value in
                print("+DC+ camera possibleSettingOptions: \(value)")
            }, onError: { error in
                print("+DC+ camera possibleSettingOptions error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
    
    func status() {
        drone!.camera.status
            .subscribe(onNext: { value in
                print("+DC+ camera status: \(value)")
            }, onError: { error in
                print("+DC+ camera status error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
}


// MARK: - Mission
extension Subscriptions {
    func missionProgress() {
        drone!.mission.missionProgress
            .subscribe(onNext: { value in
                print("+DC+ mission missionProgress: \(value)")
            }, onError: { error in
                print("+DC+ mission missionProgress error: \(String(describing: error))")
            })
            .disposed(by: disposeBag)
    }
}
