//
//  ProtocolPost.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.06.2023.
//

import Foundation

protocol PostCellDelegate: AnyObject {
    func didTapIncreaseButton(in cell: PostTableViewCell)
}
