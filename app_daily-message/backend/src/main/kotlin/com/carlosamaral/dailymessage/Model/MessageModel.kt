package com.carlosamaral.dailymessage.Model

import javax.persistence.*

@Entity(name = "message")
class MessageModel (
    @Id
    @GeneratedValue
    var id : Long? = null,
    var content : String
)
{
    override fun toString(): String {
        return "MessageModel(content: '$content')"
    }
}
