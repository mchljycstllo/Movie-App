<template>
	<div :class="['uploader_main',attr.uploader]">
		

		<div :class="['upload_container', attr.upload_container, image_file_data ? attr.image_loaded : '']" @dragover.prevent @drop.prevent @drop="dropHandler">

			<input type="file" :id="`img_id${counter}`" multiple :name="file_name" ref="file" @change="pickHandler" accept="image/*">
			<div :class="attr.image_preview" v-if="(image_file_data && preview_image) || update && image_file_data">

				<div :class="attr.div_relative">
					<img :src="image_file_data" :id="`prvw_img_id${counter}`" :class="attr.preview_image" />

					<svg xmlns="http://www.w3.org/2000/svg" :src="`${close_icon}`" :class="attr.close_button" @click="removeImage()" v-if="(removable && image_file_data && !update)" width="24" height="24" viewBox="0 0 24 24">
          <g id="Group_11973" data-name="Group 11973" transform="translate(-269.942 -27.396)">
            <g id="Path" transform="translate(271.929 29.396)" fill="#ffb450" stroke-miterlimit="10">
              <path d="M 10.00010108947754 19.25020027160645 C 7.525851249694824 19.25020027160645 5.201991081237793 18.28897094726562 3.456611156463623 16.5435905456543 C 1.711231112480164 14.79821109771729 0.750001072883606 12.47435092926025 0.750001072883606 10.00010108947754 C 0.750001072883606 7.525851249694824 1.711231112480164 5.201991081237793 3.456611156463623 3.456611156463623 C 5.201991081237793 1.711231112480164 7.525851249694824 0.750001072883606 10.00010108947754 0.750001072883606 C 12.47435092926025 0.750001072883606 14.79821109771729 1.711231112480164 16.5435905456543 3.456611156463623 C 18.28897094726562 5.201991081237793 19.25020027160645 7.525851249694824 19.25020027160645 10.00010108947754 C 19.25020027160645 12.47435092926025 18.28897094726562 14.79821109771729 16.5435905456543 16.5435905456543 C 14.79821109771729 18.28897094726562 12.47435092926025 19.25020027160645 10.00010108947754 19.25020027160645 Z" stroke="none"/>
              <path d="M 10.00010108947754 1.500001907348633 C 7.726181030273438 1.500001907348633 5.59066104888916 2.383211135864258 3.986940383911133 3.986940383911133 C 2.383211135864258 5.59066104888916 1.500001907348633 7.726181030273438 1.500001907348633 10.00010108947754 C 1.500001907348633 12.27402114868164 2.383211135864258 14.40953063964844 3.986940383911133 16.01326179504395 C 5.590671539306641 17.61699104309082 7.726181030273438 18.50020027160645 10.00010108947754 18.50020027160645 C 12.27402114868164 18.50020027160645 14.40953063964844 17.61699104309082 16.01326179504395 16.01326179504395 C 17.61699104309082 14.40953063964844 18.50020027160645 12.27402114868164 18.50020027160645 10.00010108947754 C 18.50020027160645 7.726181030273438 17.61699104309082 5.590671539306641 16.01326179504395 3.986940383911133 C 14.40953063964844 2.383211135864258 12.27402114868164 1.500001907348633 10.00010108947754 1.500001907348633 M 10.00010108947754 1.9073486328125e-06 C 15.5301513671875 1.9073486328125e-06 20.00020027160645 4.470041275024414 20.00020027160645 10.00010108947754 C 20.00020027160645 15.5301513671875 15.5301513671875 20.00020027160645 10.00010108947754 20.00020027160645 C 4.470041275024414 20.00020027160645 1.9073486328125e-06 15.5301513671875 1.9073486328125e-06 10.00010108947754 C 1.9073486328125e-06 4.470041275024414 4.470041275024414 1.9073486328125e-06 10.00010108947754 1.9073486328125e-06 Z" stroke="none" fill="#ffb450"/>
            </g>
            <g id="Group_11871" data-name="Group 11871">
              <rect id="Boundary" width="24" height="24" transform="translate(269.942 27.396)" fill="none"/>
              <g id="Path-2" data-name="Path" transform="translate(276.897 34.396)" fill="none" stroke-linecap="round" stroke-miterlimit="10">
                <path d="M10,8.59,8.59,10,5,6.41,1.41,10,0,8.59,3.59,5,0,1.41,1.41,0,5,3.59,8.59,0,10,1.41,6.41,5Z" stroke="none"/>
                <path d="M 8.590090751647949 10.00010013580322 L 5.00005054473877 6.410060405731201 L 1.410010576248169 10.00010013580322 L 5.447387820822769e-07 8.590090751647949 L 3.590040445327759 5.00005054473877 L 5.447387820822769e-07 1.410010576248169 L 1.410010576248169 5.447387820822769e-07 L 5.00005054473877 3.590040445327759 L 8.590090751647949 5.447387820822769e-07 L 10.00010013580322 1.410010576248169 L 6.410060405731201 5.00005054473877 L 10.00010013580322 8.590090751647949 L 8.590090751647949 10.00010013580322 Z" stroke="none" fill="#fff"/>
              </g>
            </g>
          </g>
					</svg>


				</div>
			</div>
			<label :for="`img_id${counter}`" slot="upload-label">
				<figure :class="attr.icon_container">
				<svg xmlns="http://www.w3.org/2000/svg" width="61.333" height="61.333" viewBox="0 0 61.333 61.333" v-if="!image_file_data">
					<g id="add_photo_alternate_black_24dp" opacity="0.4">
					<path id="Path_117" data-name="Path 117" d="M0,0H61.333V61.333H0Z" fill="none"/>
					<path id="Path_118" data-name="Path 118" d="M42.889,49.556H7.111V13.778h23V8.667h-23A5.126,5.126,0,0,0,2,13.778V49.556a5.126,5.126,0,0,0,5.111,5.111H42.889A5.126,5.126,0,0,0,48,49.556v-23H42.889Zm-19.908-8.1-5.009-6.031-7.028,9.021H39.056L30.009,32.408ZM48,8.667V1H42.889V8.667H35.222c.026.026,0,5.111,0,5.111h7.667v7.641c.026.026,5.111,0,5.111,0V13.778h7.667V8.667Z" transform="translate(3.111 1.556)"/>
					</g>
				</svg>
				</figure>
				<span :class="['upload-caption text medium', attr.hover, attr.primary_text, attr.text, attr.primary, attr.font_medium_1, attr.top_label, image_file_data ? attr.active_label : '']">
					<img src="/icons/upload.png" :class="attr.upload_image" v-if="image_file_data">
					{{ image_file_data ? `${caption.caption_3}` : `${caption.caption_1}`
				}}</span>
				<span :class="['text medium hover', attr.upload_caption, attr.underline, attr.text, attr.primary, attr.small_1, attr.center]">{{
						image_file_data ? "" : `${caption.caption_2}`
				}}</span>
			</label>

			<div :class="attr.absolute" v-if="!image_file_data">
				<div :class="['scroll_error',attr.message_container, data_errors.length > 0 ? attr.error : '' ]">
					<svg id="icon_alert_error_24px" data-name="icon/alert/error_24px" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <rect id="Boundary" width="24" height="24" fill="none"/>
            <path id="_Color" data-name=" ↳Color" d="M10,20A10,10,0,1,1,20,10,10.011,10.011,0,0,1,10,20ZM9,13v2h2V13ZM9,5v6h2V5Z" transform="translate(2 2)" fill="#d5493f"/>
					</svg>

					<label :class="['text regular', attr.tertiary_text, attr.text, attr.center, attr.gray_1, attr.message, attr.error_message]" v-if="data_errors.length > 0"> {{ data_errors[0].message }} </label>
					<label :class="['text regular', attr.tertiary_text, attr.text, attr.center, attr.gray_1, attr.message]" v-else> {{ message }} </label>
				</div>
			</div>
		</div>
		<div :class="attr.dimension_container">
			<h2 :class="[attr.text, attr.bold, attr.header]"> {{ label }} </h2>
			<span v-if="dimensions.restrict" :class="[attr.text, attr.light]"> <b>Width:</b> {{dimensions.image_width}} px, </span>
			<span v-if="dimensions.restrict" :class="[attr.text, attr.light]"> <b>Height:</b> {{dimensions.image_height}} px, </span>
			<span v-if="max_size > 0" :class="[attr.text, attr.light]"> <b> Max file size: </b> {{max_size_display}} </span>
		</div>
	</div>
</template>

<script type="text/javascript">
	export default {
		props: {
			file_name: {
				type: String,
				default: 'file[]'
			},
			uploader_name: {
				type: String,
				default: 'thubmanail'
			},	
			preview_image: {
				type: Boolean,
				default: true
			},
			removable: {
				type: Boolean,
				default: true
			},
			close_icon: {
				type: String,
				default: '/images/icons/close_button.png'
			},
			multiple: {
				type: Boolean,
				default: true
			},
			max_size: {
				type: Number,
				default: 0 //leave 0 to disable validation. if validation is needed, input size in MB (Megabyte). 0.x for KB
			},
			format: {
				type: Array/Object,
				default: function () {
					return  {
						validate_format: false,
						supported_formats: [],
						default_supported_formats: ['jpg', 'JPG',  'jpeg', 'JPEG', 'png', 'PNG', 'svg', 'SVG', 'WEBP', 'webp']
					}
				}
			},
			input_type: {
				type: String,
				default: 'image'
			},
			caption: {
				type: Array/Object,
				default: function () {
					return {
						caption_1: 'Drag and drop image',
						caption_2: 'or click here to browse photos',
						caption_3: 'Replace uploaded photo'
					}
				}
			},
			show_disabled: {
				type: Boolean,
				default: false //use this prop if parent has disabled button before submission
			},
			dimensions: {
				default: () => ({
					restrict: false,
					image_height: 0,
					image_width: 0,
					show_error: false,
					error: 'Invalid Image Dimensions'
				})
			},
			counter: {
				type: Number,
				default: 1
			},
			label: {
				type: String,
				default: ''
			},
			update: {
				type: Boolean,
				default: false //if set to true, display preview image
			},
			res_image: {
				type: String,
				default: ''
			}
		},
		data: ({max_size, res_image}) => ({
			image_file_data: res_image ? res_image : '',
			image_file: '',
			file_data: '',
			data_errors: [],
			message: '',
			actual_file: '',
			max_size_display: ''
		}),
		methods: {
			pickHandler(e){
				const me = this
				let input = e.target.files
				this.handleFile(input)
				this.actual_file = input
			},
			dropHandler (e) {
				let input = e.dataTransfer.files,
					target_file = document.getElementById(`img_id${this.counter}`)
				const data_transfer = new DataTransfer()
				data_transfer.items.add(input[0])
				target_file.files = data_transfer.files
				this.file_data = target_file.files
				this.handleFile(target_file.files)
				this.actual_file = target_file.files
			},
			handleFile (input) {
				this.validateFileSize(input[0].size)
				this.validateSupportedFormat(input[0].type)
				this.validateDimensions()
				console.log('asd')
				if (this.data_errors.length > 0) {
					this.removeImage()
					return false
				}
				let reader = new FileReader()
				reader.onload = e => {
					this.image_file_data = e.target.result
				}
				reader.readAsDataURL(input[0])
				this.file_data = input
				this.evaluateShowDisabled(false)
			},
			evaluateShowDisabled (value) {
				//use this if your parent page has disabled button. if the value is false, this won't be executed
				if (this.show_disabled) {
					this.$parent.show_disabled = value
				}
			},
			removeImage () {
				this.image_file_data = ''
				this.image_file = ''
				this.file_data = ''
				this.evaluateShowDisabled(true)
			},
			//validation methods
			validateFileSize (file_size) {
				let obj = {
					message: 'File size exceeded',
					id: 1
				}
				if (this.max_size != 0) {
					let file_size_in_MB = file_size / 1024
					let max_size_in_mb = this.max_size * 1024
					console.log(max_size_in_mb)
					console.log(file_size_in_MB)
					if (file_size_in_MB > max_size_in_mb) {
						this.pushError(obj)
					}
					else {
						this.clearErrors()
					}
				}
			},
			validateSupportedFormat (input) {
				if (this.input_type) {
					let supported_formats = []
					if (this.format.supported_formats.length > 0) {
					}
					else {
						supported_formats = this.format.default_supported_formats
					}
					let split_type = input.split("/")
					let file_type = split_type[0]
					let file_format = split_type[1]
					if (file_type == this.input_type && supported_formats.includes(file_format)) {
						this.removeIndex(2)
					}
					else {
						let obj = {
							id: 2,
							message: 'Format unsupported'
						}
						this.pushError(obj)
					}
				}
				else {
					console.log('specify a file type') // coders part
				}
			},
			validateDimensions () {
				const me = this
				if (this.dimensions.restrict) {
					let obj = {
						message: 'Invalid Dimensions',
						id: 3
					}
					//get image width and height in render
					setTimeout(() => {
						let img = document.getElementById(`prvw_img_id${this.counter}`)
						if (img.naturalWidth != this.dimensions.image_width || img.naturalHeight != this.dimensions.image_height) {
							this.pushError(obj)
						}
						else {
							this.clearErrors()
						}
					}, 100)
				}
			},
			validateImage () {
				let obj = {
					message: `The ${this.uploader_name} field is required`,
					id: 4
				}
				if (!this.image_file_data && !this.update) {
					this.pushError(obj)
				}
			},
			//end validation 	
			removeIndex (id) {
				let index = this.data_errors.findIndex((item, key) => {
					return item.id == id
				})
				this.data_errors.splice(index, 1)
			},
			clearErrors () {
				this.data_errors = []
			},
			pushError (obj) {
				this.data_errors = []
				//check muna if may error 
				if (this.data_errors.length > 0) {
					//filter kung existing na yung error
					let filtered_error = this.data_errors.filter((item, key) => {
						return item.id == obj.id
					})
					if (filtered_error.length < 1) {
						this.data_errors.push(obj)
					}
				}	
				else {
					this.data_errors.push(obj)
				}
				if (this.data_errors.length > 0) {
					this.removeImage()
				}
			},
			evaluateSizeDisplay () {
				if (this.max_size > 0) {
					let file_size = 0
					let file_size_label = ''
					let message = ''
					//evaluate if max size is 0.x
					if (this.max_size < 1) {
						file_size_label = 'KB'
						file_size = this.max_size * 1000
					}
					else {
						file_size_label = 'MB'
						file_size = this.max_size
					}
					message = 'Image must not be greater than ' + file_size + '' + file_size_label
					this.max_size_display = file_size + '' + file_size_label
					this.message = message
				}
			}	
		},
		mounted () {
			this.evaluateSizeDisplay()
		}
	}
</script>


<style lang="stylus" module="attr">
	b
		color: #999999
	.hover
		cursor: pointer
	.dimension_container 
		margin-left: 40px
	.text 
		&.bold 
			&.main_title 
				font-size: 30px
				margin-bottom: 5px
			&.total_count 
				font-size: 40px
				margin-left: 10px
		&.light 
		&.tertiary_color
			color: var(--tertiary)
		&.center 
			text-align: center
		&.align_right 
			text-align: right
		&.align_left 
			text-align: left
		&.small 
			font-size: 18px
		&.small_2
			font-size: 20px
		&.xsmall
			font-size: 16px
		&.medium 
			font-size: 28px
		&.large
			font-size: 30px
		//colors 
		&.primary 
			color: var(--primary)
		&.gray_1 
			color: var(--gray_1)
		&.gray_2 
			color: var(--gray_2)
		&.gray_3 
			color: var(--gray_3)
		&.gray_4 
			color: var(--gray_4)
		&.gray_5
			color: var(--gray_5)
		&.underline
			text-decoration: underline
		&.upload_caption
			color: gray
		&.primary_text
			color: #999999
		&.tertiary_text 
			color: #999999
			opacity: 0.8
		&.header 
			font-size: 18px
			color: #666
	.uploader
		margin: 0 20px
		.upload_container
			padding: 80px 0
			margin: 20px 40px
			border: 1px dashed #4c5a5a61
			position: relative 
			transition: .2s ease-out
			border-radius: 10px
			background: #fff
			&:hover 
				border: 1px dashed var(--theme_primary)
				cursor: pointer
			&.image_loaded
				padding: 0
				border: 5px solid transparent
				margin-bottom: 0
				.image_preview
					display: flex 
					align-items: center
					justify-content: center
					.div_relative
						position: relative
						.preview_image
							border: 2px solid transparent
							object-fit: cover 
							object-position: center
							max-width: 700px
							height: 100%
							margin: 0 auto
							position:relative
					.close_button
						position: absolute
						top: -10px
						right: -8px
			svg 
				margin-bottom: 10px
			input 
				display: none
			label 
				display: flex
				flex-direction: column
			.top_label
				display: flex
				align-items: center 
				justify-content: center
				min-width: 250px
				.upload_image
					max-width: 24px
					margin-bottom: 0
					margin-top: 2px
			.icon_container
				display: flex 
				justify-content: center
			.absolute
				position: absolute 
				bottom: 10px
				left: 0 
				right: 0
				.message_container
					display: flex 
					align-items: center 
					justify-content: center
					margin: 0 5px
					border-radius: 5px
					svg	
						display: none 
						margin-top: 10px
						margin-right: 5px 
					&.error
						background-color: #D5493F33
						svg 
							display: block
					.message 
						color: #4C5A5A80
						&.error_message
							color: var(--red)
							margin: 0
	@media(max-width: 768px) 
		.uploader
			.upload_container
				&.image_loaded
					.preview_image
						height: 100% 
						width: 100%
						display: block 
						width: 300px
	@media(max-width: 425px)
		.uploader
			.upload_container
				&.image_loaded
					.preview_image
						width: 200px
</style>