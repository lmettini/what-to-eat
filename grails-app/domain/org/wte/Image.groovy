package org.wte

class Image {

	SecUser creator
    String thumbnail
    String medium

    static constraints = {
		creator nullable: true
    }
}
