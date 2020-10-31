//
//  ChatViewController.swift
//  CarFinder
//
//  Created by Даниил Смирнов on 31.10.2020.
//  Copyright © 2020 Антон Огурцов. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
	var senderId: String = "1000"
	var displayName: String = "Businesman"
}

struct Message: MessageType {
	var sender: SenderType
	var messageId: String
	var sentDate: Date
	var kind: MessageKind
}

class ChatViewController: MessagesViewController {
	
	var messages: [Message] = [
		Message(sender: Sender(), messageId: "124", sentDate: Date(), kind: .text("Blasff")),
		Message(sender: Sender(), messageId: "125", sentDate: Date(), kind: .text("rgrg")),
		Message(sender: Sender(), messageId: "126", sentDate: Date(), kind: .text("Bfefhht5hlasff")),
		Message(sender: Sender(), messageId: "127", sentDate: Date(), kind: .text("fgrg"))
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Чат"
		modalPresentationStyle = .fullScreen
		messagesCollectionView.messagesDataSource = self
		messagesCollectionView.messagesDisplayDelegate = self
		messagesCollectionView.messagesLayoutDelegate = self
		configureMessageInputBar()
	}
	
	func configureMessageInputBar() {
		
		messageInputBar.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 150)
		messageInputBar.delegate = self
		messageInputBar.inputTextView.tintColor = .black
		messageInputBar.sendButton.setTitleColor(.black, for: .normal)
		messageInputBar.sendButton.setTitleColor(UIColor.black.withAlphaComponent(0.3), for: .highlighted)
	 }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
	}
	
	func isLastSectionVisible() -> Bool {
		
		guard !messages.isEmpty else { return false }
		
		let lastIndexPath = IndexPath(item: 0, section: messages.count - 1)
		return messagesCollectionView.indexPathsForVisibleItems.contains(lastIndexPath)
	}
	
	func insertMessage(_ message: Message) {
		
		messages.append(message)

		messagesCollectionView.performBatchUpdates({
			messagesCollectionView.insertSections([messages.count - 1])
			if messages.count >= 2 {
				messagesCollectionView.reloadSections([messages.count - 2])
			}
		}, completion: { [weak self] _ in
			if self?.isLastSectionVisible() == true {
				self?.messagesCollectionView.scrollToBottom(animated: true)
			}
		})
	}
}

extension ChatViewController: MessagesDataSource {
	
	func currentSender() -> SenderType {
		return Sender()
	}
	
	func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
		return messages[indexPath.section]
	}
	
	func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
		return messages.count
	}
}

extension ChatViewController: MessagesLayoutDelegate {
	
}

extension ChatViewController: MessagesDisplayDelegate {
	
}

extension ChatViewController: InputBarAccessoryViewDelegate {
	
	@objc
	func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
		processInputBar(messageInputBar)
	}
	
	func processInputBar(_ inputBar: InputBarAccessoryView) {
		// Here we can parse for which substrings were autocompleted
		let attributedText = inputBar.inputTextView.attributedText!
		let range = NSRange(location: 0, length: attributedText.length)
		attributedText.enumerateAttribute(.autocompleted, in: range, options: []) { (_, range, _) in
			
			let substring = attributedText.attributedSubstring(from: range)
			let context = substring.attribute(.autocompletedContext, at: 0, effectiveRange: nil)
			print("Autocompleted: `", substring, "` with context: ", context ?? [])
		}
		
		let components = inputBar.inputTextView.components
		inputBar.inputTextView.text = String()
		inputBar.invalidatePlugins()
		// Send button activity animation
		inputBar.sendButton.startAnimating()
		inputBar.inputTextView.placeholder = "Sending..."
		// Resign first responder for iPad split view
		inputBar.inputTextView.resignFirstResponder()
		DispatchQueue.global(qos: .default).async {
			// fake send request task
			sleep(1)
			DispatchQueue.main.async { [weak self] in
				inputBar.sendButton.stopAnimating()
				inputBar.inputTextView.placeholder = "Aa"
				self?.insertMessages(components)
				self?.messagesCollectionView.scrollToBottom(animated: true)
			}
		}
	}
	
	private func insertMessages(_ data: [Any]) {
		for component in data {
			if let str = component as? String {
				let message = Message(sender: Sender(), messageId: UUID().uuidString, sentDate: Date(), kind: .text(str)) 
				insertMessage(message)
			} 	
		}
	}
}
