$(document).on('turbolinks:load', function () {
    $('#browse-images').on("change", function () {

        const files = this.files
        if (!files) {
            return
        }
        const images_preview_block = $('#images-preview')
        images_preview_block.html('')
        for (i = 0; i < files.length; i++) {
            const reader = new FileReader();

            reader.onload = function (event) {
                images_preview_block.append(`
                <div class="col-md-3 px-2 pt-1">
                    <img src="${event.target.result}" class="w-100">
                </div>
                `)
            }

            reader.readAsDataURL(files[i]);
        }

    })
})