<?php
	ob_start();
	session_start();
	$pageTitle = 'Create New Item';
	include 'init.php';
	if (isset($_SESSION['user'])) {

		if ($_SERVER['REQUEST_METHOD'] == 'POST') {

			$formErrors =  array();

			$name 		=  filter_var($_POST['name'], FILTER_SANITIZE_STRING);
			$desc 		=  filter_var($_POST['description'], FILTER_SANITIZE_STRING);
			$price 		=  filter_var($_POST['price'], FILTER_SANITIZE_NUMBER_INT);
			$country 	=  filter_var($_POST['country'], FILTER_SANITIZE_STRING);
			$status 	=  filter_var($_POST['status'], FILTER_SANITIZE_NUMBER_INT);
			$category 	=  filter_var($_POST['category'], FILTER_SANITIZE_NUMBER_INT);

			// $tags 		=  filter_var($_POST['tags'], FILTER_SANITIZE_STRING);

			if (strlen($name) < 4) {

				$formErrors[] = 'Item Title Must Be At Least 4 Characters';

			}

			if (strlen($desc) < 10) {

				$formErrors[] = 'Item Description Must Be At Least 10 Characters';

			}

			if (strlen($country) < 2) {

				$formErrors[] = 'Item Title Must Be At Least 2 Characters';

			}

			if (empty($price)) {

				$formErrors[] = 'Item Price Cant Be Empty';

			}

			if (empty($status)) {

				$formErrors[] = 'Item Status Cant Be Empty';

			}

			if (empty($category)) {

				$formErrors[] = 'Item Category Cant Be Empty';

			}
			if (empty($formErrors)) {
				$ok=true;
				if(($_FILES['image']['size']>10*1000*1000)){
					$ok=false;
					echo"<script>alert('product images size is very high!!')</script>";

				}
				if( (file_exists($_FILES['image']['name']))){
					$ok=false;
					echo"<script>alert('product img is allredy exists!!')</script>";
				}
				if($ok==true){
					move_uploaded_file($_FILES['image']['tmp_name'],"images/".$_FILES['image']['name']);

					$image='images/'.$_FILES['image']['name'];

					$stmt = $con->prepare("INSERT INTO 

						items(Name, Description, Price, Country_Made,Image, Status, Add_Date, Cat_ID, Member_ID)

						VALUES(:zname, :zdesc, :zprice, :zcountry,:zimage, :zstatus, now(), :zcat, :zmember)");
				}
				$stmt->execute(array(

					'zname' 	=> $name,
					'zdesc' 	=> $desc,
					'zprice' 	=> $price,
					'zcountry' 	=> $country,
					'zimage'    => $image,
	  				'zstatus' 	=> $status,
					'zcat'		=> $category,
					'zmember'	=> $_SESSION['uid']

					// 'ztags'		=> $tags
					));


				if ($stmt) {

					$succesMsg = 'Item Has Been Added';
					
				}

			}

		}

?>
<h1 class="text-center">
	<?php echo $pageTitle ?>
</h1>
<div class="create-ad block">
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<?php echo $pageTitle ?>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-8">
						<form class="form-horizontal main-form" action="<?php echo $_SERVER['PHP_SELF'] ?>"
							method="POST" enctype="multipart/form-data">

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Name</label>
								<div class="col-sm-10 col-md-9">
									<input pattern=".{4,}" title="This Field Require At Least 4 Characters" type="text"
										name="name" class="form-control live" placeholder="Name of The Item"
										data-class=".live-title" required />
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Description</label>
								<div class="col-sm-10 col-md-9">
									<input pattern=".{10,}" title="This Field Require At Least 10 Characters"
										type="text" name="description" class="form-control live"
										placeholder="Description of The Item" data-class=".live-desc" required />
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Price</label>
								<div class="col-sm-10 col-md-9">
									<input type="text" name="price" class="form-control live"
										placeholder="Price of The Item" data-class=".live-price" required />
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Country</label>
								<div class="col-sm-10 col-md-9">
									<input type="text" name="country" class="form-control" placeholder="Country of Made"
										required />
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Image</label>
								<div class="col-sm-10 col-md-9">
									<div class="col-sm-10 col-md-9">
										<input type="file" id="image" name="image" required/>
									</div>
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Status</label>
								<div class="col-sm-10 col-md-9">
									<select name="status" required>
										<option value="">...</option>
										<option value="1">New</option>
										<option value="2">Like New</option>
										<option value="3">Used</option>
										<option value="4">Very Old</option>
									</select>
								</div>
							</div>

							<div class="form-group form-group-lg">
								<label class="col-sm-3 control-label">Category</label>
								<div class="col-sm-10 col-md-9">
									<select name="category" required>
										<option value="">...</option>
										<?php
											$cats = getAllFrom('*' ,'categories', '', '', 'ID');
											foreach ($cats as $cat) {
												echo "<option value='" . $cat['ID'] . "'>" . $cat['Name'] . "</option>";
											}
										?>
									</select>
								</div>
							</div>
							<!-- <div>
								<input type="file" id="image" name="image">
							</div> -->

							<div class="form-group form-group-lg">
								<div class="col-sm-offset-3 col-sm-9">
									<input type="submit" value="Add Item" class="btn btn-primary btn-sm" />
								</div>
							</div>

						</form>
					</div>
					<div class="col-md-4">
						<div class="thumbnail item-box live-preview">
							<span class="price-tag">
								$<span class="live-price">0</span>
							</span>
							<img class="img-responsive" src="img.png" alt="" />
							<div class="caption">
								<h3 class="live-title">Title</h3>
								<p class="live-desc">Description</p>
							</div>
						</div>
					</div>
				</div>

				<?php 
					if (! empty($formErrors)) {
						foreach ($formErrors as $error) {
							echo '<div class="alert alert-danger">' . $error . '</div>';
						}
					}
					if (isset($succesMsg)) {
						echo '<div class="alert alert-success">' . $succesMsg . '</div>';
					}
				?>

			</div>
		</div>
	</div>
</div>
<?php
	} else {
		header('Location: login.php');
		exit();
	}
	include $tpl . 'footer.php';
	ob_end_flush();
?>