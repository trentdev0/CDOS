.code16
.global Init

.org 0
Init:

	hlt

.fill 510 - (. - Init), 1, 0	# Let's make sure that here we're filling the rest 512 bytes with zeroes
.word 0xaa55					# and the last two bytes being 0x55 and 0xAA.
