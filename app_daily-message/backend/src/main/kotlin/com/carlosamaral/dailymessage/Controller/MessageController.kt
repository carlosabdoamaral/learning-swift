package com.carlosamaral.dailymessage.Controller

import com.carlosamaral.dailymessage.Model.MessageModel
import com.carlosamaral.dailymessage.Repository.MessageRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.repository.findByIdOrNull
import org.springframework.web.bind.annotation.*
import java.util.*

@RestController
@CrossOrigin
@RequestMapping("/message")
class MessageController(private val _messageRepository : MessageRepository) {

    @GetMapping
    fun allMessages() : List<MessageModel> {
        return _messageRepository.findAll()
    }

    @GetMapping("/{id}")
    fun sortMessage(@PathVariable id : Long) : MessageModel? {
        return _messageRepository.findByIdOrNull(id)
    }
}
