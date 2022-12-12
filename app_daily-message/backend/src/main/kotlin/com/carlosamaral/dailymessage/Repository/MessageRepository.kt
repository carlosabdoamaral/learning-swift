package com.carlosamaral.dailymessage.Repository

import com.carlosamaral.dailymessage.Model.MessageModel
import org.springframework.data.jpa.repository.JpaRepository

interface MessageRepository : JpaRepository<MessageModel, Long> { }
