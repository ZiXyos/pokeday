//
//  audio.manager.swift
//  pokeday
//
//  Created by Ktchoumh on 4/4/23.
//

import Foundation
import AVFoundation;

class AudioManager {
	
	private let fUrl: URL;
	let sharedSession = AVAudioSession.sharedInstance();
	public var player: AVAudioPlayer;
	
	public init(url: URL) {
		
		self.fUrl = url;
		
		do {
			
			try self.sharedSession.setActive(true);
			try self.player = AVAudioPlayer(contentsOf: self.fUrl);
			//let _ = self.initPlayer();

		} catch let error {
			fatalError("\(error)");
		}
	}
	
	public func play() -> Bool {
		self.player.setVolume(100.00, fadeDuration: 0);
		print("\(player.duration)");
		return self.player.play();
	}
	
	public func initPlayer() {
		
		if !self.player.prepareToPlay() {
			print("\(String(describing: self.player.url)) failed to prepare");
		}
	}
}
